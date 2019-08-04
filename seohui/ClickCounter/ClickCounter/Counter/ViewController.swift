//
//  ViewController.swift
//  ClickCounter
//
//  Created by seohui on 28/07/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, CountDelegate {
    @IBOutlet weak var countLabel: CounterLabel!
    private let realm = try! Realm()
    
    // connecting to counter label's count value
    private lazy var restoredCount: Count = {
        return realm.objects(Count.self).filter("saved = false").first ?? Count(count: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.delegate = self
        
        let count = restoredCount.count
        
        countLabel.initialize(to: count)
    }
    
    @IBAction func countUp(_ sender: UIButton) {
        countLabel.countUp()
    }
    
    @IBAction func countDown(_ sender: UIButton) {
        countLabel.countDown()
    }
    
    func changed(count: Int) {
        try! realm.write {
            restoredCount.count = count
            realm.add(restoredCount, update: true)
        }
    }
    
    @IBAction func moveToList(_ sender: UIButton) {
        let list = UIStoryboard.getViewController(from: "Main", identifier: "listViewController")
        navigationController?.pushViewController(list, animated: true)
    }
    
    @IBAction func saveCount(_ sender: UIButton) {
        let count = Count(count: restoredCount.count)
        
        countLabel.reset()
        
        try! realm.write {
            count.save()
            realm.add(count, update: true)
        }
    }
}
