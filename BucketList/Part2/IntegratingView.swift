//
//  IntegratingView.swift
//  BucketList
//
//  Created by Denny Arfansyah on 31/01/23.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    var id = UUID()
    
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct IntegratingView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    VStack {
                        NavigationLink {
                            Text(item.name)
                        } label: {
                            Circle()
                                .stroke(.red, lineWidth: 1)
                                .frame(width: 44, height: 44)
                        }
                    }
                }
            }
            .navigationTitle("London Explorer")
        }
    }
}

struct IntegratingView_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingView()
    }
}
