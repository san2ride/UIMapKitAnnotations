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
    @State private var selectedRestroom: Restroom?
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    private func loadRestrooms() async {
        guard let region = visibleRegion else { return }
        let coordinate = region.center
        
        do {
            restrooms = try await restroomClient.fetchRestrooms(url: Constants.Urls.restroomsByLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(restrooms) { restroom in
                    Annotation(restroom.name, coordinate: restroom.coordinate) {
                        Text("🚾")
                            .scaleEffect(selectedRestroom == restroom ? 2.0: 1.0)
                            .font(.title)
                            .onTapGesture {
                                withAnimation {
                                    selectedRestroom = restroom
                                }
                            }
                            .animation(.spring(duration: 0.05), value: selectedRestroom)
                    }
                }
                UserAnnotation()
            }
        } .task(id: locationManager.region) {
            print("region changed")
            if let region = locationManager.region {
                visibleRegion = region
                await loadRestrooms()
            }
        }
        .onMapCameraChange({ context in
            visibleRegion = context.region
        })
        .sheet(item: $selectedRestroom, content: { restroom in
            Text(restroom.name)
        })
        .overlay(alignment: .topLeading) {
            Button {
                Task {
                    await loadRestrooms()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.largeTitle)
                    //.foregroundStyle(.white, .blue)
            }.padding()
        }
    }
}

#Preview {
    WCFinderView()
        .environment(\.httpClient, RestroomClient())
}
