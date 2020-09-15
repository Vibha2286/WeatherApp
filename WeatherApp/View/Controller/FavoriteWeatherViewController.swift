//
//  FavoriteWeatherViewController.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/10.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class FavoriteWeatherViewController: UIViewController {
    
    @IBOutlet weak var favoriteWeatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "favorite".localized()
        favoriteWeatherTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoriteWeatherTableView.reloadData()
    }
}

extension FavoriteWeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteWeatherState().favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteWeatherCellView") as! FavoriteWeatherCellView
        cell.configureFavoriteData(data: FavoriteWeatherState().favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailsViewController: WeatherDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "WeatherDetailsViewController") as! WeatherDetailsViewController
        weatherDetailsViewController.initWith(savedForecast: FavoriteWeatherState().favorites[indexPath.row].current!)
        self.navigationController?.pushViewController(weatherDetailsViewController, animated: true)
    }
}
