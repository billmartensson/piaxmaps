//
//  LocationManager.swift
//  piaxmaps
//
//  Created by Bill Martensson on 2021-11-22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }

    func requestLocation() {
        //manager.requestLocation()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let firstloc = locations.first {
            if(firstloc.horizontalAccuracy > 100)
            {
                // Dålig signal
                
            }
        }
        
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Location något fel")
        
    }
    
    
    
}
