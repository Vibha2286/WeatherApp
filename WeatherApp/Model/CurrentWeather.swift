//
//  CurrentWeather.swift
//  Weather
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

struct Weather : Codable {
    let id : Int?
    let main : String?
    let description : String?
    let icon : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
    }
}

struct Main : Codable {
    let temp : Double?
    let feelsLike : Double?
    let pressure : Int?
    let humidity : Int?
    let temp_min : Double?
    let temp_max : Double?
    let sea_level : Int?
    let grnd_level : Int?
    let temp_kf : Double?
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case sea_level = "sea_level"
        case grnd_level = "grnd_level"
        case temp_kf = "temp_kf"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelsLike = try values.decodeIfPresent(Double.self, forKey: .feelsLike)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        temp_min = try values.decodeIfPresent(Double.self, forKey: .temp_min)
        temp_max = try values.decodeIfPresent(Double.self, forKey: .temp_max)
        sea_level = try values.decodeIfPresent(Int.self, forKey: .sea_level)
        grnd_level = try values.decodeIfPresent(Int.self, forKey: .grnd_level)
        temp_kf = try values.decodeIfPresent(Double.self, forKey: .temp_kf)
    }
    
    var minTemperature: String {
        if let minTempValue = temp_min {
            return  minTempValue.convertToDegree()
        }
        return ""
    }
    
    var maxTemperature: String {
        if let maxTempValue = temp_max {
            return maxTempValue.convertToDegree()
        }
        return ""
    }
    
    var currentTemperature: String {
        if let currentTempValue = temp {
            return currentTempValue.convertToDegree()
        }
        return ""
    }
}

struct Sys : Codable {
    let type : Int?
    let id : Int?
    let country : String?
    let sunrise : Int?
    let sunset : Int?
    let pod : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case pod = "pod"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        pod = try values.decodeIfPresent(String.self, forKey: .pod)
    }
}

struct Wind : Codable {
    let speed : Double?
    let deg : Int?
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
    }
}

struct CurrentWeatherOffline: Codable {
    var current: CurrentWeather?
    var forecast: ForecastWeatherResponse?
    var isFav: String?
    
    init(withCurrent current: CurrentWeather?, withForecast forecast: ForecastWeatherResponse?, withFav isFav: String?) {
        self.current = current
        self.forecast = forecast
        self.isFav = isFav
    }
    
    mutating func setFavourite(value: String) {
        self.isFav = value
    }
    
    mutating func setCurrentWeather(value: CurrentWeather) {
        self.current = value
    }

}

struct CurrentWeather: Codable {
    let weather : [Weather]?
    let base : String?
    let main : Main?
    let visibility : Int?
    let wind : Wind?
    let dt : Int?
    let sys : Sys?
    let timezone : Int?
    let id : Int?
    let name : String?
    let cod : Int?
    
    enum CodingKeys: String, CodingKey {
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
    }
    
    var weatherType: String {
        if let infoArr = self.weather, let status = infoArr.first?.main {
            return status.uppercased()
        }
        return ""
    }
}
