//
//  ViewController.swift
//  RealmTasksTutorial
//
//  Created by seohui on 28/04/2019.
//  Copyright © 2019 seohui. All rights reserved.
//

import UIKit
import RealmSwift

// MAKR: Model

final class TaskList: Object {
    @objc dynamic var text = ""
    @objc dynamic var id = ""
    let items = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class Task: Object {
    @objc dynamic var text = ""
    @objc dynamic var completed = false
}

class ViewController: UITableViewController {
    var items = List<Task>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // items.append(Task(value: ["text": "My First Task"]))
    }
    
    // Cell
    func setupUI() {
        title = "My Tasks"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // UITableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.alpha = item.completed ? 0.5 : 1
        
        return cell
    }
    
    // Task Cell add function
    func add() {
        let alertController = UIAlertController(title: "New Task", message: "Enter Task Name", preferredStyle: .alert)
        
    }
    
}
