//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherViewModel {
    
    private weak var view: WeatherView?
    var repository = WeatherRepositoryImplementation()
    var currentWeather: CurrentWeather?
    var forecastWeather: ForecastWeatherResponse?
    var state = FavoriteWeatherState()
    
    init(view: WeatherView) {
        self.view = view
    }
    
    func setCurrentLatLong() -> GetWeatherRequestModel {
        guard let currenLocation = LocationManager.shared.currentLocation else {
            return GetWeatherRequestModel()
        }
        var requestObject = GetWeatherRequestModel()
        requestObject.lat = "\(currenLocation.coordinate.latitude)"
        requestObject.lon = "\(currenLocation.coordinate.longitude)"
        return requestObject
    }
    
    func configureCurrentWeather(){
        view?.configureTodaysTempreture(currentTemp: currentWeather?.main?.currentTemperature ?? "")
        view?.configureMinimumTempreture(minTemp: currentWeather?.main?.minTemperature ?? "")
        view?.configureMaximumTempreture(maxTemp: currentWeather?.main?.maxTemperature ?? "")
        configureWeatherTheme(type: currentWeather?.weatherType.lowercased() ?? "")
    }
    
    func configureForecastWeather(){
        self.state.current = forecastWeather
        view?.configureCurrentCity(city: forecastWeather?.city?.name ?? "")
        view?.configureForecastDataForWeek(data: forecastWeather?.configureForecastDetails() ?? [])
        view?.configureView()
    }
    
    func configureWeatherTheme(type: String) {
        var state: CurrentWeatherState = .sunny
        if type == "cloud".localized() || type == "mist".localized() || type == "thunderstorm".localized() {
            state = .cloudy
        } else if type == "haze".localized() || type == "rain".localized() || type == "smoke".localized() || type == "drizzle".localized() {
            state = .rainy
        } else {
            state = .sunny
        }
        view?.configureWeatherBackground(state: state, type: type.uppercased())
    }
    
    func getWeatherData() {
        if !self.checkInternetConnectivity() {
            return
        }
        
        view?.showActivityProgressView()
        repository.getCurrentWeather(model: setCurrentLatLong(), completionHandler: { (currentWeather, error) in
            if let currentWeather = currentWeather {
                self.currentWeather = currentWeather
                self.configureCurrentWeather()
                self.view?.hideActivityProgressView()
            } else {
                self.view?.hideActivityProgressView()
            }
        })
        
        repository.getForecastWeather(model: setCurrentLatLong(), completionHandler: { (forecastWeatherResponse, error) in
            if let forecastWeatherResponse = forecastWeatherResponse {
                self.state.current = forecastWeatherResponse
                self.forecastWeather = forecastWeatherResponse
                self.configureForecastWeather()
                self.view?.hideActivityProgressView()
            } else {
                self.view?.hideActivityProgressView()
            }
        })
    }
    
    func setWeatherAsFavoriteOrUnfavorite() -> Bool {
        var isWeatherFav = self.state.isFavorite()
        if isWeatherFav {
            isWeatherFav = false
            self.state.removeFavorite()
        } else {
            self.state.addFavorite()
            isWeatherFav = true
        }
        
        return isWeatherFav
    }
    
    func loadOfflineData() {
        if let forecastWeatherResponse = FavoriteWeatherState().favorites.last?.current {
            self.state.current = forecastWeatherResponse
            self.forecastWeather = forecastWeatherResponse
            self.configureForecastWeather()
            view?.configureTodaysTempreture(currentTemp:forecastWeatherResponse.list?[0].main?.currentTemperature ?? "")
            view?.configureMinimumTempreture(minTemp: forecastWeatherResponse.list?[0].main?.temp_max?.convertToDegree() ?? "")
            view?.configureMaximumTempreture(maxTemp: forecastWeatherResponse.list?[0].main?.temp_min?.convertToDegree() ?? "")
            configureWeatherTheme(type: forecastWeatherResponse.list?[0].weather?[0].main?.lowercased() ?? "")
        }
    }
    
    func checkInternetConnectivity() -> Bool {
        if !ReachabilityManager.shared.isConnectedToNetwork() {
            if FavoriteWeatherState().favorites.count > 0 {
                self.view?.showRetryAlertIfConnectionFail(title: "noConnection".localized(), message: "loadOffline".localized(), offlineData: true)
            } else {
                self.view?.showRetryAlertIfConnectionFail(title: "noConnection".localized(), message: "pleaseRetry".localized(), offlineData: false)
            }
            return false
        }
        return true
    }
}


