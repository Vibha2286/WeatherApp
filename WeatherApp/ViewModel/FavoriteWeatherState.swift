//
//  FavoriteWeatherState.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/12.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import CoreLocation

final class FavoriteWeatherState {
    
    static let favoritesKey = "WEATHER_FAVORITES" // static key for UserDefaults
        
    var hasInfo: Bool = false
    
    var favorites: [Favorite] = FavoriteWeatherState.loadFavorites() {
        didSet {
            saveFavorites()
        }
    }
    
    var current: ForecastWeatherResponse? = nil {
        didSet {
            if !hasInfo {
                hasInfo = true
            }
        }
    }
    
    public var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: LocationManager.shared.getCurrentLocation()?.latitude ?? 0.0, longitude: LocationManager.shared.getCurrentLocation()?.longitude ?? 0.0)

    
    // determines if favorite exists in collection
    func isFavorite() -> Bool {
          guard let favorite = getFavorite() else {
              return false
          }
    
        let results = favorites.filter { $0.name ==  favorite.name}
        if results.count > 0 {
            return true
        } else {
           return false
        }
    }

  
    // adds favorite to local collection
    func addFavorite() {
        guard let favorite = getFavorite() else {
            return
        }
        print("\(favorite.name) \(favorite.coordinate.toCoreLocationCoordinate())")
        favorites.append(favorite)
    }
    
    // removes favorite from local collection
    func removeFavorite() {
        guard let favorite = getFavorite() else {
            return
        }
        
        let favIndex = favorites.firstIndex {
            $0.coordinate.areCoordinatesEqualToOther(coord: favorite.coordinate)
        }
        
        guard let index = favIndex, index > -1 else { return }
        favorites.remove(at: index)
    }
    
    // saves favorites in this instance to UserDefaults
    func saveFavorites() {
        guard let encodedFavs = try? JSONEncoder().encode(favorites) else {
            print("Failed to encode Favorites")
            return
        }
        UserDefaults.standard.set(encodedFavs, forKey: FavoriteWeatherState.favoritesKey)
    }
    
    // creates a Favorite object from the current response data
    private func getFavorite() -> Favorite? {
        guard let currentValue = current else {
            print("No data to convert to Favorite")
            return nil
        }
        
        coordinates = CLLocationCoordinate2D(latitude: LocationManager.shared.getCurrentLocation()?.latitude ?? 0.0, longitude: LocationManager.shared.getCurrentLocation()?.longitude ?? 0.0)

        return Favorite(id: favorites.count, coordinate: coordinates.toCodable() , name: currentValue.city?.name ?? "", tempreture:currentValue.list?[0].main?.currentTemperature ?? "", weatherType: currentValue.list?[0].weather?[0].main ?? "", current: currentValue)
    }
    
    // MARK: Static functions
    
    // loads any Favorites stored in UserDefaults
    static func loadFavorites() -> [Favorite] {
        guard let favoriteData = UserDefaults.standard.value(forKey: favoritesKey) as? Data,
            let decodedFavs = try? JSONDecoder().decode(Array.self, from: favoriteData) as [Favorite]
            else {
                print("Failed to decode Favorites")
                return []
        }
        
        return decodedFavs
    }
}
