//
//  ContentView.swift
//  piaxmaps
//
//  Created by Bill Martensson on 2021-11-22.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.61259201984638, longitude: 12.993687792841314), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))

    
    @StateObject var locationManager = LocationManager()

    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Map(coordinateRegion: $region, showsUserLocation: true)
                        .frame(height: 300)
            
            
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            LocationButton(.sendMyCurrentLocation) {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



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
