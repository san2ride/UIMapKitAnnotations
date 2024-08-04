//
//  Constants.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import Foundation

struct Constants {
    struct Urls {
        static func restroomsByLocation(latitude: Double, longitude: Double) -> URL {
            return URL(string: "https://www.refugerestrooms.org/api/v1/restrooms/by_location?lat=\(latitude)&lng=\(longitude)")!
        }
    }
}
