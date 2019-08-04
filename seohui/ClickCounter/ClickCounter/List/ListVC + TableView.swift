//
//  ListVC + TableView.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyCountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countCell", for: indexPath) as! CountCell
        let count = dummyCountArray[indexPath.row]
        
        cell.load(with: count)
        
        return cell
    }
}
