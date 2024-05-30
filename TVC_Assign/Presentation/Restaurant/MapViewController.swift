//
//  MapViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    var data: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat = data?.latitude
        let lon = data?.longitude
        
        let center = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: lon ?? 0.0)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = data?.name
        mapView.addAnnotation(annotation)
        
        mapView.delegate = self
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: any MKAnnotation) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
}
