//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class WeatherDetailsViewModel {
    
    private weak var view: WeatherDetailsView?
    var forecast: ForecastWeatherResponse!
    
    init(view: WeatherDetailsView, forecastData: ForecastWeatherResponse?) {
        self.view = view
        self.forecast = forecastData
    }
    
    func configureWeatherDetails() {
        view?.configureCityName(cityName: self.forecast?.city?.name ?? "")
        view?.configureSavedTempreture(temp: self.forecast?.list?[0].main?.currentTemperature ?? "")
        view?.configureSunriseAndSunset(sunrise: self.forecast?.city?.sunrise?.dateFromMilliseconds().hourMinute() ?? "", sunset: self.forecast?.city?.sunset?.dateFromMilliseconds().hourMinute() ?? "")
        view?.configurePressureAndHumidity(pressure: "\(self.forecast?.list?[0].main?.pressure ?? 0) hPa", humidity: "\(self.forecast?.list?[0].main?.humidity ?? 0)%")
        view?.configureVisibilityAndFeelsLikeTemp(visibility: "\(Float(self.forecast?.list?[0].visibility ?? 0/1000)) Km", feelsLike: self.forecast?.list?[0].main?.feelsLike?.convertToDegree() ?? "")
        view?.configureHighAndLowTemp(max: self.forecast?.list?[0].main?.temp_max?.convertToDegree() ?? "", min: self.forecast?.list?[0].main?.temp_min?.convertToDegree() ?? "")
        configureWeatherTheme(type: self.forecast?.list?[0].weather?[0].main?.lowercased() ?? "")

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

}
