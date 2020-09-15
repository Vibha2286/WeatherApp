//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

protocol WeatherView: class {
    func configureView()
    func configureCurrentCity(city: String)
    func configureTodaysTempreture(currentTemp: String)
    func configureMinimumTempreture(minTemp: String)
    func configureMaximumTempreture(maxTemp: String)
    func configureForecastDataForWeek(data: [List])
    func showActivityProgressView()
    func hideActivityProgressView()
    func configureWeatherBackground(state: CurrentWeatherState, type: String)
    func showRetryAlertIfConnectionFail(title: String, message: String, offlineData:Bool)
}
