//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Vibha on 2020/09/14.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
import Cuckoo
import CoreLocation

@testable import WeatherApp

class WeatherViewModelTests: XCTestCase {
    
    private var serviceUnderTest: WeatherViewModel!
    private var mockedView = MockWeatherView()
    private var repository = WeatherRepositoryImplementation()
    
    override func setUp() {
        super.setUp()
        serviceUnderTest = WeatherViewModel(view: mockedView)
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        super.tearDown()
    }
    
    func testThatConfigureCurrentWeatherInvokesCorrectMethods() {
        
        stub(mockedView) {
            when($0.configureTodaysTempreture(currentTemp: any())).thenDoNothing()
            when($0.configureMinimumTempreture(minTemp: any())).thenDoNothing()
            when($0.configureMaximumTempreture(maxTemp: any())).thenDoNothing()
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        
        serviceUnderTest.configureCurrentWeather()
        
        verify(mockedView).configureTodaysTempreture(currentTemp: any())
        verify(mockedView).configureMaximumTempreture(maxTemp: any())
        verify(mockedView).configureMinimumTempreture(minTemp: any())
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testThatConfigureForecastWeatherInvokesCorrectMethods() {
        
        stub(mockedView) {
            when($0.configureCurrentCity(city: any())).thenDoNothing()
            when($0.configureForecastDataForWeek(data: any())).thenDoNothing()
            when($0.configureView()).thenDoNothing()
        }
        
        serviceUnderTest.configureForecastWeather()
        
        verify(mockedView).configureCurrentCity(city: any())
        verify(mockedView).configureForecastDataForWeek(data: any())
        verify(mockedView).configureView()
    }
    
    func testWeatherIsFavoriteOrUnfavorite() {
        if serviceUnderTest.state.isFavorite() {
            XCTAssertEqual(serviceUnderTest.setWeatherAsFavoriteOrUnfavorite(), true,"weather favorite button is enable")
        } else {
            XCTAssertEqual(!serviceUnderTest.setWeatherAsFavoriteOrUnfavorite(), false, "weather favorite button is not enable")
        }
    }
    
    func testConfigureWeatherThemeForCloud() {
        stub(mockedView) {
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        serviceUnderTest.configureWeatherTheme(type: "cloud")
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testConfigureWeatherThemeForRain() {
        stub(mockedView) {
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        serviceUnderTest.configureWeatherTheme(type: "rain")
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testConfigureWeatherThemeForClear() {
        stub(mockedView) {
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        serviceUnderTest.configureWeatherTheme(type: "clear")
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testConfigureWeatherThemeForThunderstorm() {
        stub(mockedView) {
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        serviceUnderTest.configureWeatherTheme(type: "thunderstorm")
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testConfigureWeatherThemeForHaze() {
        stub(mockedView) {
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        serviceUnderTest.configureWeatherTheme(type: "haze")
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
    }
    
    func testLoadOfflineDataIfItemIsInFavoriteList() {
        stub(mockedView) {
            when($0.configureView()).thenDoNothing()
            when($0.configureCurrentCity(city: any())).thenDoNothing()
            when($0.configureForecastDataForWeek(data: any())).thenDoNothing()
            when($0.configureTodaysTempreture(currentTemp: any())).thenDoNothing()
            when($0.configureMinimumTempreture(minTemp: any())).thenDoNothing()
            when($0.configureMaximumTempreture(maxTemp: any())).thenDoNothing()
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        
        serviceUnderTest.loadOfflineData()
        
        if  FavoriteWeatherState().favorites.last?.current != nil {
            verify(mockedView).configureView()
            verify(mockedView).configureCurrentCity(city: any())
            verify(mockedView).configureForecastDataForWeek(data: any())
            verify(mockedView).configureTodaysTempreture(currentTemp: any())
            verify(mockedView).configureMaximumTempreture(maxTemp: any())
            verify(mockedView).configureMinimumTempreture(minTemp: any())
            verify(mockedView).configureWeatherBackground(state: any(), type: any())
        }
    }
    
    func testInternetConnectivity() {
        if !ReachabilityManager.shared.isConnectedToNetwork() {
            stub(mockedView) {
                when($0.showRetryAlertIfConnectionFail(title: any(), message: any(), offlineData: any())).thenDoNothing()
            }
            
            if FavoriteWeatherState().favorites.count > 0 {
                 verify(mockedView).showRetryAlertIfConnectionFail(title: any(), message: any(), offlineData: true)
            }
            
            XCTAssertFalse(serviceUnderTest.checkInternetConnectivity())
           
        } else {
            
            XCTAssertTrue(serviceUnderTest.checkInternetConnectivity())
            
        }
    }
    
    func testGetWeatherData() {
        if !ReachabilityManager.shared.isConnectedToNetwork() {
            stub(mockedView) {
                when($0.showRetryAlertIfConnectionFail(title: any(), message: any(), offlineData: any())).thenDoNothing()
            }
            
            let location: CLLocation? = CLLocation(
                latitude: 37.3317,
                longitude: -122.0325086
            )
            
            LocationManager.shared.currentLocation = location
            XCTAssertNotNil(serviceUnderTest.setCurrentLatLong())
            XCTAssertFalse(serviceUnderTest.checkInternetConnectivity())
            
            verify(mockedView).showRetryAlertIfConnectionFail(title: any(), message: any(), offlineData: any())
        } else {
            
            stub(mockedView) {
                when($0.showActivityProgressView()).thenDoNothing()
                when($0.hideActivityProgressView()).thenDoNothing()
            }
            
            LocationManager.shared.locationManager.startUpdatingLocation()
            
            let location: CLLocation? = CLLocation(
                latitude: 37.3317,
                longitude: -122.0325086
            )
            
            LocationManager.shared.currentLocation = location
            XCTAssertNotNil(serviceUnderTest.setCurrentLatLong())
            
            repository.getCurrentWeather(model: serviceUnderTest.setCurrentLatLong()) { (currentWeather, error) in
                if let weather = currentWeather {
                    self.serviceUnderTest.currentWeather = weather
                    verify(self.mockedView).hideActivityProgressView()
                } else {
                    XCTFail(error?.localizedDescription ?? "")
                    verify(self.mockedView).hideActivityProgressView()
                }
            }
            
            repository.getForecastWeather(model: serviceUnderTest.setCurrentLatLong()) { (forecastWeather, error) in
                if let weather = forecastWeather {
                    self.serviceUnderTest.forecastWeather = weather
                    verify(self.mockedView).hideActivityProgressView()
                } else {
                    XCTFail(error?.localizedDescription ?? "")
                    verify(self.mockedView).hideActivityProgressView()
                }
            }
            
            serviceUnderTest.getWeatherData()
            verify(mockedView).showActivityProgressView()
        }
    }
    
}
