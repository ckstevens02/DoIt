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
        
        //refers to the contents of the internal database storage
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //getting access to coreData
        let task = Task(context: context)
        
        task.name = taskName.text!
        task.important = importantSwitch.isOn
        
        //saves to coreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        //pops over to the previous screen when clicked
        navigationController?.popViewController(animated: true)
        
    }


}
