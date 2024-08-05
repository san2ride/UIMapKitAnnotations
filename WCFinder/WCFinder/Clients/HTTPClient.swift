//
//  HTTPClient.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/5/24.
//

import Foundation

protocol HTTPClient {
    func fetchRestrooms(url: URL) async throws -> [Restroom]
}
