//
//  ContentView.swift
//  piaxmaps
//
//  Created by Bill Martensson on 2021-11-22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.61259201984638, longitude: 12.993687792841314), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))

    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Map(coordinateRegion: $region, showsUserLocation: true)
                        .frame(height: 300)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
