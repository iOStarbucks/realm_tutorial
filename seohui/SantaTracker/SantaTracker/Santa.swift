//
//  Santa.swift
//  SantaTracker
//
//  Created by seohui on 19/05/2019.
//  Copyright © 2019 seohui. All rights reserved.
//


// Make class for data synchronization
import RealmSwift

class Santa:Object {
    @objc dynamic var _currentLocation: Location?
    var currentLocation: Location {
        get {
            // If we don't know where Santa is, he's probably still at home
            return _currentLocation ?? Location(latitude: 90, longitude: 180)
        }
        set {
            _currentLocation = newValue
        }
    }
    
    // TODO: ignoredProperties
    override static func ignoredProperties() -> [String] {
        return ["currentLocation"]
    }
}

// for Test
extension Santa {
    static func test() -> Santa {
        let santa = Santa()
        // seoul
        santa.currentLocation = Location(latitude: 37.566535, longitude: 126.977969)
        return santa
    }
}
