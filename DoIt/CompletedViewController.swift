//
//  CompletedViewController.swift
//  DoIt
//
//  Created by Christina Stevens on 4/28/17.
//  Copyright © 2017 Christina Stevens. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {

    @IBOutlet weak var choreLabel: UILabel!
    
    //tasksVC
    var tasksVC = TasksViewController()
    
    //recording the rowNumber index to delete
    var rowNumber = 0
    
    //task is brought in by the sender segue
    var task = Task()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //assigning the chore label to the name of the task
        if task.important == true {
            choreLabel.text = "❗️\(task.name)"
        }
        else {
            choreLabel.text = task.name
        }
        
        
    }

    @IBAction func completeButton(_ sender: Any) {
        
        //delete task to the list
        
        tasksVC.tasks.remove(at: tasksVC.rowNumber)
        
        //updates the tableView
        tasksVC.tableView.reloadData()
        
        //pops over to the previous screen when clicked
        navigationController?.popViewController(animated: true)
    }
   

}
