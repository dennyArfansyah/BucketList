//
//  SwitchingView.swift
//  BucketList
//
//  Created by Denny Arfansyah on 31/01/23.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success...")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed...")
    }
}

struct SwitchingView: View {
    let state = LoadingState.loading

    var body: some View {
        switch state {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct SwitchingView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingView()
    }
}
