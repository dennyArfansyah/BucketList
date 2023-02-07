//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Denny Arfansyah on 08/02/23.
//

import Foundation
import LocalAuthentication
import MapKit

extension MapView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0)
                                                          , span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [LocationCoordinate]
        @Published var selectedPlace: LocationCoordinate?
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathExtension("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([LocationCoordinate].self, from: data)
            } catch {
                locations = []
            }
        }
        
        private func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addLocation() {
            let locationCoordinate = LocationCoordinate(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(locationCoordinate)
            save()
        }
        
        func update(location: LocationCoordinate) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authentateError in
                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        
                    }
                }
            } else {
                
            }
        }
    }
    
}
