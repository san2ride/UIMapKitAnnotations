//
//  WCFinderView.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import SwiftUI

struct WCFinderView: View {
    
    @Environment(\.httpClient) private var restroomClient
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WCFinderView()
        .environment(\.httpClient, RestroomClient())
}
