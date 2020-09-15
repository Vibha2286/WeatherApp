//
//  MapViewModel.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import MapKit

class MapViewModel {
    
    private weak var view: MapView?
    
    init(view: MapView) {
        self.view = view
    }
    
    func configureMap() {
        setPinOnMap(favorite: FavoriteWeatherState().favorites)
    }
    
    func setPinOnMap(favorite: [Favorite]) {
        view?.setUserLocation(value: true)
        for fav in favorite {
            let annotation = MKPointAnnotation()
            annotation.title =  fav.name
            annotation.subtitle = fav.weatherType
            annotation.coordinate = fav.coordinate.toCoreLocationCoordinate()
            view?.configureAllAnnotationPoint(annotation: annotation)
        }
        view?.configureAllPinsWithZoomout()
    }
    
}
