//
//  ListViewController.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var countTable: UITableView!
    
    let dummyCountArray = [
        Count(count: 4),
        Count(count: 40)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTable.dataSource = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
