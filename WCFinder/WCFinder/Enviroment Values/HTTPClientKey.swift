//
//  HTTPClientKey.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import Foundation
import SwiftUI

private struct HTTPClientKey: EnvironmentKey {
    static var defaultValue = RestroomClient()
}

extension EnvironmentValues {
    var httpClient: RestroomClient {
        get { self[HTTPClientKey.self] }
        set { self[HTTPClientKey.self] = newValue }
    }
}
