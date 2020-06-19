//
//  ToDoListTasksTableViewController.swift
//  ToDoList
//
//  Created by Sergey on 6/16/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListTasksTableViewController: UITableViewController {

    var realm: Realm!
    //Creating an array of all ToDoListElements that will be stored in the project
    var toDoList: Results<ToDoListDatabase> {
        get {
            return realm.objects(ToDoListDatabase.self)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        //Creating an Alert to be able to add new task using it.
        let alert = UIAlertController(title: "New Task", message: "What's your new task?", preferredStyle: .alert)
        //Add a textfielf to the alert to be able to type a new task.
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Type your task..."
        }
        //Create cancel button to be able to get back if decided not to write down a task.
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        //Add cancel button to the alert.
        alert.addAction(cancel)
        //Create add button to be able to save new tasks.
        let add = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) -> Void in
            let newTaskTextField = (alert.textFields?.first)! as UITextField
            let newToDoTask = ToDoListDatabase()
            newToDoTask.title = newTaskTextField.text!
            newToDoTask.done = false
        //Save new task into realm.
            try! self.realm.write({
                self.realm.add(newToDoTask)
            })
            self.tableView.insertRows(at: [IndexPath.init(row: self.toDoList.count - 1, section: 0)], with: .automatic)
        }
        //Add add button to the alert.
        alert.addAction(add)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        
        let backgroundImage = UIImage(named: "paper")
        let imageView = UIImageView(image: backgroundImage)
        imageView.alpha = 0.4
        imageView.contentMode = .scaleToFill
        self.tableView.backgroundView = imageView
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows equals number of ToDoListElements
        toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Creating a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let item = toDoList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.backgroundColor = .clear
        cell.accessoryType = item.done == true ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //When the row is tapped the property done is changed and saved into realm
        let item = toDoList[indexPath.row]
        try! self.realm.write({
            item.done = !item.done
        })
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let item = toDoList[indexPath.row]
            
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


