//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var savedTempreture: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var sunriseParameter: UILabel!
    @IBOutlet weak var sunsetParameter: UILabel!
    @IBOutlet weak var pressureParameter: UILabel!
    @IBOutlet weak var humidityParameter: UILabel!
    @IBOutlet weak var visibilityParameter: UILabel!
    @IBOutlet weak var feelsLikeParameter: UILabel!
    @IBOutlet weak var highTempreture: UILabel!
    @IBOutlet weak var lowTempreture: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    var forecast: ForecastWeatherResponse?
    private lazy var viewModel = WeatherDetailsViewModel(view: self, forecastData: forecast!)
    
    func initWith(savedForecast: ForecastWeatherResponse?) {
           self.forecast = savedForecast
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "weatherDetails".localized()
        viewModel.configureWeatherDetails()
    }
}

extension WeatherDetailsViewController: WeatherDetailsView {
    func configureCityName(cityName: String) {
        self.cityName.text = cityName
    }
    
    func configureSavedTempreture(temp: String) {
        self.savedTempreture.text = temp
    }
    
    func configureSunriseAndSunset(sunrise: String, sunset: String) {
        self.sunriseParameter.text = sunrise
        self.sunsetParameter.text = sunset
    }
    
    func configurePressureAndHumidity(pressure: String, humidity: String) {
        self.pressureParameter.text = pressure
        self.humidityParameter.text = humidity
    }
    
    func configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String) {
         self.visibilityParameter.text = visibility
         self.feelsLikeParameter.text = feelsLike
    }
    
    func configureHighAndLowTemp(max: String, min: String) {
        self.highTempreture.text = max
        self.lowTempreture.text = min
    }
    
    func configureWeatherBackground(state: CurrentWeatherState, type: String) {
        switch state {
        case .cloudy:
             weatherImage.image = WeatherImages.forestCloudy
        case .rainy:
             weatherImage.image = WeatherImages.forestRainy
        case .sunny:
             weatherImage.image = WeatherImages.forestSunny
        }
        self.weatherType.text = type
    }
}
