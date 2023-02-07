//
//  EditView.swift
//  BucketList
//
//  Created by Denny Arfansyah on 03/02/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: LocationCoordinate
    var onSave: (LocationCoordinate) -> Void
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: LocationCoordinate, onSave: @escaping(LocationCoordinate) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: LocationCoordinate.example) { _ in }
    }
}
