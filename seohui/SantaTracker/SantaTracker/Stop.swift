//
//  Stop.swift
//  SantaTracker
//
//  Created by seohui on 02/06/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

// a stop is just somewhere that Santa will be, and when he’ll be there


import Foundation
import RealmSwift

class Stop: Object {
    @objc dynamic var location: Location?
    @objc dynamic var time: Date = Date(timeIntervalSinceReferenceDate: 0)
    
    convenience init(location: Location, time: Date) {
        self.init()
        self.location = location
        self.time = time
    }
}
