//
//  AddScreenViewController.swift
//  DoIt
//
//  Created by Christina Stevens on 4/27/17.
//  Copyright © 2017 Christina Stevens. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTaskButton(_ sender: Any) {
        //create a task from the outlet
        
        let task = Task()
        task.name = taskName.text!
        task.important = importantSwitch.isOn
        
        //add task to the list
        
        previousVC.tasks.append(task)
        
        //updates the tableView
        previousVC.tableView.reloadData()
        
        //pops over to the previous screen when clicked
        navigationController?.popViewController(animated: true)
        
    }


}
