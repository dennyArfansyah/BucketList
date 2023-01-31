//
//  ComparableView.swift
//  BucketList
//
//  Created by Denny Arfansyah on 31/01/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableView: View {
    let users = [
        User(firstName: "Denny", lastName: "Landzard"),
        User(firstName: "Astri", lastName: "Aisyah"),
        User(firstName: "Budi", lastName: "Dalton")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ComparableView_Previews: PreviewProvider {
    static var previews: some View {
        ComparableView()
    }
}
