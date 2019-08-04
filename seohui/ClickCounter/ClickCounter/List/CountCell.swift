//
//  CountCell.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit

class CountCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var savedCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func load(with count: Count) {
        dateLabel.text = "\(Date(milliseconds: count.timestamp))"
        savedCountLabel.text = "\(count.count)"
    }
}
