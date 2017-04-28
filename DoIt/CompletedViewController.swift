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
    
    
    //task is brought in by the sender segue
    //setting to be a Task optional
    var task : Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assigning the chore label to the name of the task
        if task!.important == true {
            choreLabel.text = "❗️\(task!.name!)"
        }
        else {
            choreLabel.text = task!.name!
        }
        
    }
    
    @IBAction func completeButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deleting the task that was chosen
        context.delete(task!)
        
        //saving the new coreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //pops over to the previous screen when clicked
        navigationController?.popViewController(animated: true)
    }
    
    
}
