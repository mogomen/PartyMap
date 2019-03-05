//
//  MapViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 07/01/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    var delegate: DelegateMapViewController!
    
    @IBAction func button(_ sender: Any) {
        delegate?.toggleLeftPanel!()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // moving mapView to the left and back
    @objc func  buttonAction() {
        
        var animation = false
        if animation == false {
            UIView.animate(withDuration: 0.3, animations: {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                }, completion: nil)
                self.myMap.frame = CGRect(x: -236, y: 0, width: self.myMap.frame.width, height: self.myMap.frame.height)
                animation = true
            })
        }
        if animation == true {
            UIView.animate(withDuration: 0.3, animations: {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    
                }, completion: nil)
                
                self.myMap.frame = CGRect(x: -280, y: 0, width: self.myMap.frame.width, height: self.myMap.frame.height)
                animation = false
            })
        }
    }
    
    // geoposition
    let locationManager = CLLocationManager()
    let regionInMetters: Double = 1000
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let span = MKCoordinateSpan(latitudeDelta: 1000, longitudeDelta: 1000)
            let region = MKCoordinateRegion.init(center: location, span: span)
            myMap.setRegion(region, animated: true)
        }
    }
    
    func checklocationServices () {
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()// setup our location manager
            checkLocationAuthorization()
        } else {
            // show the alert letting the users know they have to turn this on
        }
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackinUserLocation ()  
        case .denied:
            break
        case .notDetermined:
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    func startTrackinUserLocation () {
        myMap.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.stopUpdatingLocation()
        
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return } // sand line
        let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 4000, longitudeDelta: 4000)
        let region = MKCoordinateRegion.init(center: center, span: span)
        myMap.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
    
    


