//
//  ViewController.swift
//  GMaps
//
//  Created by Karthik on 9/23/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

class ViewController: UIViewController {
    
    var location = CLLocationManager()
    
    var currentLocation : CLLocation?
    
    @IBOutlet var mapView: GMSMapView!
    
    var sourceLat : CLLocationDegrees!
    var sourceLong : CLLocationDegrees!
    var destinationLat : CLLocationDegrees! = 12.922915
    var destinationLong : CLLocationDegrees! = 80.127457
    
    let parser = Parser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView.isMyLocationEnabled = true
        location.delegate = self
        location.startUpdatingLocation()
        location.requestWhenInUseAuthorization()
        location.desiredAccuracy=kCLLocationAccuracyBest

        parser.saveData()
        parser.retrieveData {
            cust in
            self.sourceLat = CLLocationDegrees(cust[0].lattitude)
            self.sourceLong = CLLocationDegrees(cust[0].longitude)
        }
        
        
    }
    
    func drawPath(from polyLine: String){
        let path = GMSPath(fromEncodedPath: polyLine)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3.0
        polyline.strokeColor = .systemBlue
        polyline.map = mapView
        
        setMarker()
        
        
    }
    
    func setMarker() {
        //Due to restrictions in using Places API, marker not set.
        let cam = GMSCameraPosition.camera(withLatitude: destinationLat, longitude: destinationLong, zoom: 10)
        mapView.animate(to: cam)
        
    }
    
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.first?.coordinate
        sourceLat = (current?.latitude)!
        sourceLong = (current?.longitude)!
        
        //getRoute(loc: locations.first!)
        //Currently hardcoding the route, since Places API is restricted to use.
        drawPath(from: poly1)
        
    }
    
}


