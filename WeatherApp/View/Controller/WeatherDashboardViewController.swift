//
//  ViewController.swift
//  Weather app
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class WeatherDashboardViewController: UIViewController {
    
    @IBOutlet weak var dailyWeatherTableView: UITableView!
    @IBOutlet weak var weatherBackgroundImage: UIImageView!
    @IBOutlet weak var tempretureContainer: UIView!
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var currentCity: UILabel!
    @IBOutlet weak var todaysTempreture: UILabel!
    @IBOutlet weak var todaysWeather: UILabel!
    @IBOutlet weak var minimumTempreture: UILabel!
    @IBOutlet weak var currentTempreture: UILabel!
    @IBOutlet weak var maximumTempreture: UILabel!
    @IBOutlet weak var favoriteWeather: UIButton!
    @IBOutlet weak var reloadWeather: UIButton!
    
    private var progressHud = ProgressHudView()
    private lazy var viewModel = WeatherViewModel(view: self)
    private var forrcastData : [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerInternalNotifications()
        dailyWeatherTableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LocationManager.shared.requestAuthorizationIfNeeded()
        navigationController?.setNavigationBarHidden(true, animated: false)
        if !viewModel.checkInternetConnectivity() {
            reloadWeather.isHidden = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func registerInternalNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(locationAllowed), name: .locationAllowed, object: nil)
    }
    
    @objc private func locationAllowed() {
        self.favoriteWeather.isSelected = viewModel.state.isFavorite() ? true : false
        LocationManager.shared.locationManager.startUpdatingLocation()
        viewModel.getWeatherData()
    }
    
    @IBAction func ActionToRefreshDashboard(_ sender: UIButton) {
        if viewModel.checkInternetConnectivity() {
                 viewModel.getWeatherData()
        }
    }
    
    @IBAction func ActionToAddFavoriteWeather(_ sender: UIButton) {
        favoriteWeather.isSelected = viewModel.setWeatherAsFavoriteOrUnfavorite() ? true : false
    }
    
    @IBAction func ActionToShowAllFavoriteList(_ sender: UIButton) {
        let favoriteViewController: FavoriteWeatherViewController = storyboard?.instantiateViewController(withIdentifier: "FavoriteWeatherViewController") as! FavoriteWeatherViewController
        self.navigationController?.pushViewController(favoriteViewController, animated: true)
    }
    
    @IBAction func ActionToShowAllMapPoints(_ sender: UIButton) {
        let mapViewController: MapViewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
}

extension WeatherDashboardViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forrcastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherCellView") as! DailyWeatherCellView
        cell.configureForecastData(forecastData: forrcastData[indexPath.row])
        return cell
    }
}

extension WeatherDashboardViewController : WeatherView {
    
    func configureView() {
        self.favoriteWeather.isHidden = false
        self.favoriteWeather.isSelected = viewModel.state.isFavorite() ? true : false
    }
    
    func configureCurrentCity(city: String) {
        self.currentCity.text = city
    }
    
    func configureTodaysTempreture(currentTemp: String) {
        self.todaysTempreture.text = currentTemp
        self.currentTempreture.text = currentTemp
    }
    
    func configureMinimumTempreture(minTemp: String) {
        self.minimumTempreture.text = minTemp
    }
    
    func configureMaximumTempreture(maxTemp: String) {
        self.maximumTempreture.text = maxTemp
    }
    
    func configureForecastDataForWeek(data: [List]) {
        self.forrcastData = data
        dailyWeatherTableView.reloadData()
    }
    
    func configureWeatherBackground(state: CurrentWeatherState, type: String) {
        self.todaysWeather.text = type
        switch state {
        case .cloudy:
             weatherBackgroundImage.image = WeatherImages.forestCloudy
             dailyWeatherTableView.backgroundColor = UIColor(hexString: CustomColors.cloudy)
             tempretureContainer.backgroundColor = UIColor(hexString: CustomColors.cloudy)
        case .rainy:
             weatherBackgroundImage.image = WeatherImages.forestRainy
             dailyWeatherTableView.backgroundColor = UIColor(hexString: CustomColors.rainy)
             tempretureContainer.backgroundColor = UIColor(hexString: CustomColors.rainy)
        case .sunny:
             weatherBackgroundImage.image = WeatherImages.forestSunny
             dailyWeatherTableView.backgroundColor =  UIColor(hexString: CustomColors.sunny)
             tempretureContainer.backgroundColor = UIColor(hexString: CustomColors.sunny)
        }
    }
    
    func showRetryAlertIfConnectionFail(title: String, message: String, offlineData:Bool) {
        self.favoriteWeather.isHidden = true
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
        if offlineData {
            let offButton = UIAlertAction(title: "offline".localized(), style: .cancel, handler: { _ in
                self.viewModel.loadOfflineData()
            })
            alert.addAction(offButton)
        } else {
            let cancelButton = UIAlertAction(title: "cancel".localized(), style: .cancel, handler: nil)
            alert.addAction(cancelButton)
        }
       
        let retryButton = UIAlertAction(title: "retry".localized(), style: .default, handler: { _ in
            self.viewModel.getWeatherData()
        })
        alert.addAction(retryButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActivityProgressView() {
        progressHud = ProgressHudView.showProgressHud(inView: self.view)
    }
    
    func hideActivityProgressView() {
        progressHud.hide()
    }
}
