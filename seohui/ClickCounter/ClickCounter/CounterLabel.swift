//
//  CounterLabel.swift
//  ClickCounter
//
//  Created by seohui on 28/07/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation
import UIKit

class CounterLabel: UILabel {
    var delegate: CountDelegate?
    
    private var count = 0 {
        didSet(value) {
            text = "\(count)"
            delegate?.changed(count: count)
        }
    }
    
    func initialize(to count: Int) {
        self.count = count
    }
    
    func countUp() {
        count += 1
    }
    
    func countDown() {
        count -= 1
    }
}
