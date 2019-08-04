//
//  Count.swift
//  ClickCounter
//
//  Created by seohui on 28/07/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation
import RealmSwift

class Count: Object {
    @objc dynamic var timestamp = 0
    @objc dynamic var count = 0
    
    convenience init(count: Int) {
        self.init()
        self.timestamp = Date().millisecondsSince1970
        self.count = count
    }
    
    override static func primaryKey() -> String? {
        return "timestamp"
    }
}
