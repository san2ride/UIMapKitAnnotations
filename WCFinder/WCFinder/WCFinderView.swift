//
//  WCFinderView.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import SwiftUI
import MapKit

struct WCFinderView: View {
    
    @Environment(\.httpClient) private var restroomClient
    @State private var locationManager = LocationManager.shared
    @State private var restrooms: [Restroom] = []
    
    private func loadRestrooms() async {
        guard let region = locationManager.region else { return }
        let coordinate = region.center
        
        do {
            restrooms = try await restroomClient.fetchRestrooms(url: Constants.Urls.restroomsByLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        ZStack {
            Map {
                ForEach(restrooms) { restroom in
                    Marker(restroom.name, coordinate: restroom.coordinate)
                }
                UserAnnotation()
            }
        } .task(id: locationManager.region) {
            await loadRestrooms()
        }
    }
}

#Preview {
    WCFinderView()
        .environment(\.httpClient, RestroomClient())
}
