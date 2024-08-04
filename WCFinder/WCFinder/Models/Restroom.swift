//
//  Restroom.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/4/24.
//

import Foundation
import CoreLocation

struct Restroom: Decodable {
    
    let id: Int
    let name: String
    let street: String 
    let city: String
    let state: String
    let comment: String?
    let accessible: Bool
    let unisex: Bool
    let changingTable: Bool
    let latitude: Double
    let longitude: Double
    
    var address: String {
        "\(street), \(city), \(state)"
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id 
        case name
        case street
        case city
        case state
        case comment
        case accessible
        case unisex
        case changingTable = "changing_table"
        case latitude
        case longitude
    }
}
