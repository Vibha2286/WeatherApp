//
//  ForecastWeatherResponse.swift
//  Weather
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import CoreLocation

struct City : Codable {
    let id : Int?
    let name : String?
    let coord : Coordinate?
    let country : String?
    let population : Int?
    let timezone : Int?
    let sunrise : Int?
    let sunset : Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        coord = try values.decodeIfPresent(Coordinate.self, forKey: .coord)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
    }
}

struct Clouds : Codable {
    let all : Int?
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(Int.self, forKey: .all)
    }
}

public struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
    
    // converts to a Core Location coordinate if needed
    func toCoreLocationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // comparator for Coordinate (Codable) objects
    func areCoordinatesEqualToOther(coord: Coordinate) -> Bool {
        return latitude == coord.latitude && longitude == coord.longitude
    }
}

struct List : Codable, Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.dt == rhs.dt
    }
    
    let dt : Int?
    let main : Main?
    let weather : [Weather]?
    let clouds : Clouds?
    let wind : Wind?
    let sys : Sys?
    let dt_txt : String?
    let visibility : Int?
        
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case sys = "sys"
        case dt_txt = "dt_txt"
        case visibility = "visibility"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
    }
}

struct ForecastWeatherResponse : Codable {
    let cod : String?
    let message : Int?
    let cnt : Int?
    let list : [List]?
    let city : City?
    
    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
        case city = "city"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cod = try values.decodeIfPresent(String.self, forKey: .cod)
        message = try values.decodeIfPresent(Int.self, forKey: .message)
        cnt = try values.decodeIfPresent(Int.self, forKey: .cnt)
        list = try values.decodeIfPresent([List].self, forKey: .list)
        city = try values.decodeIfPresent(City.self, forKey: .city)
    }
    
    //MARK:-  Update UI according to next five days weather API response
    func configureForecastDetails() -> [List] {
        var forecastItems =  [List]()
        var dateAtIndex: Date? = nil
        if let itemsArray = self.list {
            //Need to iterate because there is more than one entry for the same day(for every 3 hours)
            for item in itemsArray {
                if let epochTime = item.dt {
                    if dateAtIndex == nil {
                        dateAtIndex = Utility.convertEpochTimeToActualDate(epochTime: Double(epochTime))
                        let cal = Calendar.current.compare(dateAtIndex!, to: Date(), toGranularity: Calendar.Component.day)
                        if cal == .orderedDescending {
                            forecastItems.append(item)
                        }
                    } else {
                        let loopDate = Utility.convertEpochTimeToActualDate(epochTime: Double(epochTime))
                        if let date = dateAtIndex {
                            let cal = Calendar.current.compare(date, to: loopDate, toGranularity: Calendar.Component.day)
                            if cal == .orderedAscending {
                                dateAtIndex = nil
                            }
                        }
                    }
                }
            }
            return forecastItems
        }
        return []
    }

}
