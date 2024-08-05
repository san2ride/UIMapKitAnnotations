//
//  MapCameraPosition+Ext.swift
//  WCFinder
//
//  Created by Jason Sanchez on 8/5/24.
//

import UIKit
import MapKit
import SwiftUI

extension MapCameraPosition {
    static var vail: MapCameraPosition {
        .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.643844,
                                                                  longitude: -106.380903),
                                                                  latitudinalMeters: 500,
                                                                  longitudinalMeters: 500))
    }
}
