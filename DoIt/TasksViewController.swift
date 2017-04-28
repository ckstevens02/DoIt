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
    
    //viewDidLoad only gets called the first time that the viewController is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //notifies the viewController that something new is about to be added to the screen
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        
        //make sure that the new data is reloaded
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important == true {
            cell.textLabel?.text = "❗️" + task.name!
        }
        else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    

    @IBAction func addItem(_ sender: Any) {
        
    performSegue(withIdentifier: "addItemScreen", sender: nil)
    }
    
    
    //fetches all the data from coreData and then appends it to the list called tasks
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //using do/catch in case an error is thrown
        do{
            //fetch the data from our class called Task and put it into the array called tasks
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch{
            //in case of an error, do the 'catch'
            print("Error!!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "selectTask" {
            let nextVC = segue.destination as! CompletedViewController
            
            //this sends over the task that is clicked
            nextVC.task = sender as? Task
            
        }
        
    }
}

