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
    private lazy var countObject: Count = {
        return realm.objects(Count.self).first ?? Count(count: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.delegate = self
        
        let count = countObject.count
        
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
            countObject.count = count
            realm.add(countObject, update: true)
        }
    }
    
    @IBAction func moveToList(_ sender: UIButton) {
        let list = UIStoryboard.getViewController(from: "Main", identifier: "listViewController")
        navigationController?.pushViewController(list, animated: true)
    }
}

extension UIStoryboard {
    class func getViewController(from storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
