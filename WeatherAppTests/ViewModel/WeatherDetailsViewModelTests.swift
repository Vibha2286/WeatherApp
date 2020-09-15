//
//  WeatherDetailsViewModelTests.swift
//  WeatherAppTests
//
//  Created by Vibha on 2020/09/14.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
import Cuckoo

@testable import WeatherApp

class WeatherDetailsViewModelTests: XCTestCase {
    
    private var serviceUnderTest: WeatherDetailsViewModel!
    private var mockedView = MockWeatherDetailsView()
    
    override func setUp() {
        super.setUp()
        serviceUnderTest = WeatherDetailsViewModel(view: mockedView, forecastData: mockedForecastData)
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        super.tearDown()
    }
    
    func testConfigureWeatherDetails() {
        stub(mockedView) {
            when($0.configureCityName(cityName: any())).thenDoNothing()
            when($0.configureSavedTempreture(temp: any())).thenDoNothing()
            when($0.configureSunriseAndSunset(sunrise: any(), sunset: any())).thenDoNothing()
            when($0.configurePressureAndHumidity(pressure: any(), humidity: any())).thenDoNothing()
            when($0.configureVisibilityAndFeelsLikeTemp(visibility: any(), feelsLike: any())).thenDoNothing()
            when($0.configureHighAndLowTemp(max: any(), min: any())).thenDoNothing()
            when($0.configureWeatherBackground(state: any(), type: any())).thenDoNothing()
        }
        
        serviceUnderTest.configureWeatherDetails()
        
        verify(mockedView).configureCityName(cityName: any())
        verify(mockedView).configureSavedTempreture(temp: any())
        verify(mockedView).configureSunriseAndSunset(sunrise: any(), sunset: any())
        verify(mockedView).configurePressureAndHumidity(pressure: any(), humidity: any())
        verify(mockedView).configureVisibilityAndFeelsLikeTemp(visibility: any(), feelsLike: any())
        verify(mockedView).configureHighAndLowTemp(max: any(), min: any())
        verify(mockedView).configureWeatherBackground(state: any(), type: any())
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

    
    private var mockedForecastData: ForecastWeatherResponse? {
        return FavoriteWeatherState().favorites.last?.current
       }

}
