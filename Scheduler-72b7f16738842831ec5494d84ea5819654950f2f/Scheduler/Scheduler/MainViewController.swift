//
//  MainViewController.swift
//  Scheduler
//
//  Created by JIAJUN LIANG on 11/17/18.
//  Copyright © 2018 JIAJUN LIANG. All rights reserved.
//

import UIKit
import Foundation



class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainTableViewCellDelegate {
    
    var schedule = Schedule()

    
    
    @IBOutlet weak var listOfTasks: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("hey i am main")
        listOfTasks.dataSource = self
        listOfTasks.delegate = self
        
        self.schedule = Schedule.init(ifGenerateTasks: true)
        self.listOfTasks.reloadData()
    }

    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schedule.tasks.count
    }
    
    // Set each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! MainTableViewCell
        
        // current task
        let currentKey = self.schedule.tasks[indexPath.row]
        cell.taskTitleLabel.text = "\(currentKey.title) : \(indexPath.row)"
        cell.dueDayLabel.text = "Due on \(currentKey.due_date.month) / \(currentKey.due_date.day) / \(currentKey.due_date.year)"
        
        // countdown?
        cell.daysLeftLabel.text = "9 days left"
        
        cell.delegate = self
        
        return cell
    }
    
    // Tap on a cell: go to details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap on cell \(indexPath.row)")
    }
    
    // Swipe left to delete a cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.schedule.tasks.remove(at: indexPath.row)
            //tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    
    // The cell calls this method when the user taps the edit button
    func MainTableViewCellDidTapEdit(_ sender: MainTableViewCell) {
        print("go to edit view")
    }
    
    @IBAction func addOnTap(_ sender: UIButton) {
        print("go to add task view")
        
    }
    
    
    @IBAction func dailyPlannerOnTap(_ sender: UIButton) {
        print("go to daily planner")
    }
    
    
}

