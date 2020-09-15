//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

protocol WeatherDetailsView: class {
    func configureWeatherBackground(state: CurrentWeatherState, type: String)
    func configureCityName(cityName: String)
    func configureSavedTempreture(temp: String)
    func configureSunriseAndSunset(sunrise: String, sunset: String)
    func configurePressureAndHumidity(pressure: String, humidity: String)
    func configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)
    func configureHighAndLowTemp(max: String, min: String)
}
