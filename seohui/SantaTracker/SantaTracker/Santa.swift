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
    // Santa's current location
    @objc private dynamic var _currentLocation: Location?
    var currentLocation: Location {
        get {
            // If we don't know where Santa is, he's probably still at home
            return _currentLocation ?? Location(latitude: 90, longitude: 180)
        }
        set {
            _currentLocation = newValue
        }
    }
    
    // List of where Santa will be and when(stop)
    let route = List<Stop>()
    
    @objc private dynamic var _activity: Int = 0
    var activity: Activity {
        get {
            return Activity(rawValue: _activity)!
        }
        set {
            _activity = newValue.rawValue
        }
    }
    
    @objc dynamic var presentsRemaining: Int = 0
    
    // TODO: ignoredProperties
    override static func ignoredProperties() -> [String] {
        return ["currentLocation", "activity"]
    }
}

// Test Santa for Test
extension Santa {
    static func test() -> Santa {
        let santa = Santa()
        // seoul
        santa.currentLocation = Location(latitude: 37.566535, longitude: 126.977969)
        santa.activity = .deliveringPresents
        santa.presentsRemaining = 37
        return santa
    }
}
