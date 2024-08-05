//
//  MockRestroomClient.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/5/24.
//

import Foundation

struct MockRestroomClient: HTTPClient {
    func fetchRestrooms(url: URL) async throws -> [Restroom] {
        return PreviewData.load(resourceName: "restrooms")
    }
}