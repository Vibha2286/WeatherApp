//
//  MapView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import MapKit

protocol MapView: class {
    func configureAllAnnotationPoint(annotation : MKPointAnnotation)
    func setUserLocation(value: Bool)
    func configureAllPinsWithZoomout()
}
