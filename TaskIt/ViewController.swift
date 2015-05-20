//
//  ViewController.swift
//  TaskIt
//
//  Created by Jake Spirek on 4/14/15.
//  Copyright (c) 2015 Jake Spirek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
//    var taskArray:[Dictionary<String,String>] = []

    var taskArray:[TaskModel] = []
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //        let task1:Dictionary<String, String> = ["task": "Study French", "subtask": "Verbs", "date": "01/14/2014"]
        
        let date1 = Date.from(year: 2014, month: 05, day: 10)
        let date2 = Date.from(year: 2015, month: 04, day: 1)
        let date3 = Date.from(year: 2015, month: 5, day: 16)
        
        
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: date3)
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
//            let indexPath = sender as NSIndexPath
            let thisTask = taskArray[indexPath!.row]
//            let thisTask = taskArray[indexPath.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        let thisTask = taskArray[indexPath.row]

        var cell: TaskTableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskTableViewCell

//      cell.taskLabel.text = taskDict["task"]
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask

        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
        
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
//        performSegueWithIdentifier("showTaskDetail", sender: indexPath)
        
    }


}

