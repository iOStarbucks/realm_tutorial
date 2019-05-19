//
//  Location.swift
//  SantaTracker
//
//  Created by seohui on 19/05/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import RealmSwift
import MapKit

class Location:Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
}

