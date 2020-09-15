//
//  Favorite.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

struct Favorite: Identifiable, Codable {
    var id: Int
    var coordinate: Coordinate
    var name: String
    var tempreture: String
    var weatherType: String
    var current: ForecastWeatherResponse?
}
