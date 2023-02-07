//
//  Location.swift
//  BucketList
//
//  Created by Denny Arfansyah on 31/01/23.
//

import Foundation
import CoreLocation

struct LocationCoordinate: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = LocationCoordinate(id: UUID(), name: "Buckingham palace", description: "Where the queen lives with ther dorgis", latitude: 51.4, longitude: -0.141)
    
    static func ==(lhs: LocationCoordinate, rhs: LocationCoordinate) -> Bool {
        lhs.id == rhs.id
    }
}

