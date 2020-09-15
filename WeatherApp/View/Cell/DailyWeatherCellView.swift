//
//  DailyWeatherCellView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import UIKit

class DailyWeatherCellView: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempreture: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureForecastData(forecastData: List) {
        self.day.text = forecastData.dt?.dateFromMilliseconds().dayWord()
        self.tempreture.text = forecastData.main?.currentTemperature
        
        if let type = forecastData.weather?.first?.main {
            if type == "cloud".localized() || type == "mist".localized() || type == "clear".localized() {
                self.iconImage.image = WeatherImages.clear
            } else if type == "haze".localized() || type == "rain".localized() || type == "smoke".localized() || type == "drizzle".localized() {
                self.iconImage.image = WeatherImages.rain
            } else {
                self.iconImage.image = WeatherImages.partlySunny
            }
        }
    }
}
