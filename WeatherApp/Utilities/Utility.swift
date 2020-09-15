//
//  Utility.swift
//  WeatherApplication
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class Utility {
        
    //Convert Epoch time to actual time
    static func convertEpochTimeToActualTime(epochTime: Double) -> String {
        let date = Date(timeIntervalSince1970: epochTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.full //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    //Convert Epoch time to Date time Format
    static func convertEpochTimeToActualDate(epochTime: Double) -> Date {
        let date = Date(timeIntervalSince1970: epochTime)
        return date
    }
}
