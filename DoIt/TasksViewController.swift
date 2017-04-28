//
//  TasksViewController.swift
//  DoIt
//
//  Created by Christina Stevens on 4/27/17.
//  Copyright © 2017 Christina Stevens. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    //identifying which rowNumber is chosen
    var rowNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = createTask()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important == true {
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //updating row number
        rowNumber = indexPath.row
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
  
    func createTask() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Groceries"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }

    @IBAction func addItem(_ sender: Any) {
        
    performSegue(withIdentifier: "addItemScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemScreen" {
            let nextVC = segue.destination as! AddScreenViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTask" {
            let nextVC = segue.destination as! CompletedViewController
            
            //this sends over the task that is clicked
            nextVC.task = sender as! Task
            
            nextVC.tasksVC = self
        }
        
    }
}

