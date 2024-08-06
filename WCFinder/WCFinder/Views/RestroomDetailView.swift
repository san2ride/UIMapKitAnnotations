//
//  RestroomDetailView.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/6/24.
//

import SwiftUI

struct AmenitiesView: View {
    let restroom: Restroom
    
    var body: some View {
        HStack(spacing: 12) {
            AmenityView(symbol: "♿️", isEnabled: restroom.accessible)
            AmenityView(symbol: "🚻", isEnabled: restroom.unisex)
            AmenityView(symbol: "🚼", isEnabled: restroom.changingTable)
        }
    }
}

struct AmenityView: View {
    let symbol: String
    let isEnabled: Bool
    
    var body: some View {
        if isEnabled {
            Text(symbol)
        }
    }
}

struct RestroomDetailView: View {
    
    let restroom: Restroom
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(restroom.name)
                .font(.title3)
            Text(restroom.address)
            if let comment = restroom.comment {
                Text(comment)
                    .font(.caption)
            }
            
            AmenitiesView(restroom: restroom)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let restrooms: [Restroom] = PreviewData.load(resourceName: "restrooms")
    return RestroomDetailView(restroom: restrooms.first!)
}
