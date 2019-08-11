//
//  ListViewController.swift
//  ClickCounter
//
//  Created by seohui on 04/08/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var countTable: UITableView!
    
    let realm = try! Realm()
    
    lazy var countArray: [Count] = {
        return Array(realm.objects(Count.self).filter("saved = true").sorted(byKeyPath: "timestamp"))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTable.dataSource = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
