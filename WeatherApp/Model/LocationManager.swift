//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/12.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    private struct Configuration {
        static let maxDistanceInMeters: Double = 1000.0
    }
    
    private override init() {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    static let shared: LocationManager = { return LocationManager() }()

    public func requestAuthorizationIfNeeded() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if CLLocationManager.authorizationStatus() == .denied {
            NotificationCenter.default.post(name: .locationDenied, object: nil)
            return
        }
         locationManager.startUpdatingLocation()
    }
    
    public func getCurrentLocation() -> CLLocationCoordinate2D? {
        let realLocation = locationManager.location
        guard let _ = currentLocation else {
            self.currentLocation = realLocation
            return self.currentLocation?.coordinate
        }
        
        let distanceInMeters = getDistanceToLocation(realLocation)
        if distanceInMeters > Configuration.maxDistanceInMeters {
            self.currentLocation = realLocation
            NotificationCenter.default.post(name: .currentLocationChanged, object: nil)
        }
        return self.currentLocation?.coordinate
    }
    
    public func getDistanceToLocation(_ location: CLLocation?) -> Double {
        guard let currentLocation = currentLocation, let toLocation = location else {
            return 0.0
        }
        
        let distanceInMeters = currentLocation.distance(from: toLocation)
        return distanceInMeters
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var shouldIAllow = false
        var notDetermined = false
        var locationStatus: String
        
        switch status {
        case .restricted:
            locationStatus = "Restricted Access to location"
        case .denied:
            locationStatus = "User denied access to location"
        case .notDetermined:
            locationStatus = "Status not determined"
            notDetermined = true
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }

        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            locationManager.startUpdatingLocation()
            self.currentLocation = locationManager.location
        } else {
            NSLog("Denied access: \(locationStatus)")
            if !notDetermined {
                NotificationCenter.default.post(name: .locationDenied, object: nil)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locationManager.location
        NotificationCenter.default.post(name: .locationAllowed, object: nil)
    }
    
}
