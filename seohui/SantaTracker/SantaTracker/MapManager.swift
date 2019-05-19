//
//  MapManager.swift
//  SantaTracker
//
//  Created by seohui on 19/05/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit
import MapKit

class MapManager: NSObject {
    private let santaAnnotation = MKPointAnnotation()
    
    init(mapView: MKMapView) {
        santaAnnotation.title = "🎅"
        super.init()
        mapView.addAnnotation(self.santaAnnotation)
    }
    
    func update(with santa: Santa) {
        // Update the map to show Santa's new location
        let santaLocation = santa.currentLocation.clLocationCoordinate2D
        DispatchQueue.main.async {
            self.santaAnnotation.coordinate = santaLocation
        }
    }
}

// Converting Locations to CLLocationCoordinate2D(MapKit use this)
private extension Location {
    var clLocationCoordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
