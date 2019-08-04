//
//  Array + Safe.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
