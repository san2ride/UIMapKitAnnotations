//
//  PreviewData.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/5/24.
//

import Foundation

struct PreviewData {
    static func load<T: Decodable>(resourceName: String) -> T {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource \(resourceName) does not exist.")
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
