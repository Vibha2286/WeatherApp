//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/12.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private lazy var viewModel = MapViewModel(view: self)
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "map".localized()
        viewModel.configureMap()
    }
}

extension MapViewController: MapView {
    
    func configureAllAnnotationPoint(annotation : MKPointAnnotation) {
        mapView.addAnnotation(annotation)
    }
    
    func setUserLocation(value: Bool) {
        mapView.showsUserLocation = value
    }
    
    func configureAllPinsWithZoomout() {
         var zoomRect = MKMapRect.null
               for annotation in mapView.annotations {
                   let annotationPoint = MKMapPoint(annotation.coordinate)
                   let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
                   
                   if (zoomRect.isNull) {
                       zoomRect = pointRect
                   } else {
                       zoomRect = zoomRect.union(pointRect)
                   }
               }
               self.mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       guard annotation is MKPointAnnotation else { return nil }

       let identifier = "Annotation"
       var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

       if annotationView == nil {
           annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
           annotationView!.canShowCallout = true
       } else {
           annotationView!.annotation = annotation
       }

       return annotationView
   }

}
