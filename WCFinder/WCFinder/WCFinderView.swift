//
//  WCFinderView.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import SwiftUI

struct WCFinderView: View {
    
    @Environment(\.httpClient) private var restroomClient
    @State private var locationManager = LocationManager.shared
    
    private func loadRestrooms() async {
        guard let region = locationManager.region else { return }
        let coordinate = region.center
        
        //restroomClient.fetchRestrooms(url: <#T##URL#>)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WCFinderView()
        .environment(\.httpClient, RestroomClient())
}
