//
//  FancyPlace.swift
//  piaxmaps
//
//  Created by Bill Martensson on 2021-11-22.
//

import Foundation
import CoreLocation

struct FancyPlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    let placename : String
    let placedescription : String

    init(id: UUID = UUID(), lat: Double, long: Double, thename : String, thedesc : String) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
        self.placename = thename
        self.placedescription = thedesc
    }
}
