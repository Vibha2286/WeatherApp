//
//  FavoriteWeatherCellView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/12.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class FavoriteWeatherCellView: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempreture: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureFavoriteData(data: Favorite) {
        self.cityName.text = data.name
        self.tempreture.text = data.tempreture
        self.weatherType.text = data.weatherType
        let type = data.weatherType.lowercased()
        if type == "cloud".localized() || type == "mist".localized() {
            self.iconImage.image = WeatherImages.forestCloudy
        } else if type == "haze".localized() || type == "rain".localized() || type == "smoke".localized() || type == "drizzle".localized() {
            self.iconImage.image = WeatherImages.forestRainy
        } else {
            self.iconImage.image = WeatherImages.forestSunny
        }
    }
}
