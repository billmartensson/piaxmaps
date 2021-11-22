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
    
    let place1: FancyPlace = FancyPlace(lat: 55.61259201984638, long: 12.993687792841314, thename: "Klaffbron", thedesc: "Det är en bro")

    let place2: FancyPlace = FancyPlace(lat: 55.61121346105315, long: 12.994470997892961, thename: "Minc", thedesc: "Ett hus")

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Image(systemName: "map")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20.0, height: 20.0)
            
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [place1,place2]) { loopplace in
                    /*
                    MapMarker(coordinate: place.location,
                              tint: Color.purple)
                    */
                    MapAnnotation(coordinate: loopplace.location) {
                        /*
                        Rectangle().stroke(Color.blue).background(Color.red)
                        .frame(width: 20, height: 20)
                        */
                        
                        FancyMappinView(pininfo: loopplace)
                    }
                    
                }
            
            
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








