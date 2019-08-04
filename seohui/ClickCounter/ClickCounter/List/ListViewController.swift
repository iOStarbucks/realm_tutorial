//
//  ListViewController.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var countTable: UITableView!
    
    private let dummyCountArray = [
        Count(count: 4),
        Count(count: 40)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyCountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countCell", for: indexPath) as! CountCell
        let count = dummyCountArray[indexPath.row]
        
        cell.dateLabel.text = "\(Date(milliseconds: count.timestamp))"
        cell.savedCountLabel.text = "\(count.count)"
        
        return cell
    }
}
