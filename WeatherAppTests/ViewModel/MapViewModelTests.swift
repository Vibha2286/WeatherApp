//
//  MapViewModelTests.swift
//  WeatherAppTests
//
//  Created by Vibha on 2020/09/14.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
import Cuckoo
import CoreLocation

@testable import WeatherApp

class MapViewModelTests: XCTestCase {
    
    private var serviceUnderTest: MapViewModel!
    private var mockedView = MockMapView()
    
    override func setUp() {
        super.setUp()
        serviceUnderTest = MapViewModel(view: mockedView)
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        super.tearDown()
    }
    
    func testThatConfigureViewInvokesCorrectMethods() {
        stub(mockedView) {
            when($0.setUserLocation(value: any())).thenDoNothing()
            when($0.configureAllAnnotationPoint(annotation: any())).thenDoNothing()
            when($0.configureAllPinsWithZoomout()).thenDoNothing()
        }
        
        serviceUnderTest.configureMap()
        
        verify(mockedView).setUserLocation(value: any())
        
        if FavoriteWeatherState().favorites.count > 0 {
            verify(mockedView, atLeastOnce()).configureAllAnnotationPoint(annotation: any())
            verify(mockedView).configureAllPinsWithZoomout()
        }
    }
    
    func testThatConfigureViewCorrectMethods() {
        stub(mockedView) {
            when($0.setUserLocation(value: any())).thenDoNothing()
            when($0.configureAllAnnotationPoint(annotation: any())).thenDoNothing()
            when($0.configureAllPinsWithZoomout()).thenDoNothing()
        }
        
        if FavoriteWeatherState().favorites.count == 0 {
            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: LocationManager.shared.getCurrentLocation()?.latitude ?? 0.0, longitude: LocationManager.shared.getCurrentLocation()?.longitude ?? 0.0)
            
            let fav : Favorite = Favorite(id: 0, coordinate: coordinates.toCodable(), name: "test", tempreture: "", weatherType: "", current: nil)
            
            FavoriteWeatherState().favorites.append(fav)
        }
        
        serviceUnderTest.setPinOnMap(favorite: FavoriteWeatherState().favorites)
        
        verify(mockedView).setUserLocation(value: any())
        verify(mockedView).configureAllPinsWithZoomout()
        verify(mockedView, atLeastOnce()).configureAllAnnotationPoint(annotation: any())
        
        if FavoriteWeatherState().favorites.last?.name == "test" {
            FavoriteWeatherState().favorites.removeLast()
        }
    }
    
}
