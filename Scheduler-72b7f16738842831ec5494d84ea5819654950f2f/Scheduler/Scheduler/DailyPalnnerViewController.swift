//
//  DailyPalnnerViewController.swift
//  DailyPlanner4
//
//  Created by Hanxing Zhang on 2018/11/19.
//  Copyright © 2018 Hanxing Zhang. All rights reserved.
//

import UIKit


class DailyPalnnerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NoteViewDelegate {
    
    
    
    @IBOutlet weak var dailyTasks: UITableView!
//    var models: [[String]] = [["2-4","write app"],["1-5","feed cat"],["3-5","walk dog"]]
    var models: [[String]] = []
    var rowChosen = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyTasks.delegate = self
        dailyTasks.dataSource = self
        dailyTasks.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dailyTasks.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return models.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyPlannerCell", for: indexPath as IndexPath)
        
        // Configure the cell...
        cell.textLabel?.text = models[indexPath.row][0]
        cell.detailTextLabel?.text = models[indexPath.row][1]
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
            
            let closure = { (action: UIAlertAction!) -> Void in
                if action.title == "Delete" {
                    self.models.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                }
            }

            
            let action1 = UIAlertAction(title: "Delete", style: .default, handler: closure)
            
            let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in })
            
            alertController.addAction(action1)
            alertController.addAction(action2)
            self.present(alertController, animated: true, completion: nil)
            
//            models.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowChosen = indexPath.row

    }
    
    @IBAction func deleteAllPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "alert", message: "Are you sure you want to delete all tasks?", preferredStyle: .alert)
        
        let closure = { (action: UIAlertAction!) -> Void in
            if action.title == "Delete all" {
                self.models.removeAll()
                self.dailyTasks.reloadData()
            }
        }
        
        
        let action1 = UIAlertAction(title: "Delete all", style: .default, handler: closure)
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in })
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
//        models.removeAll()
//        dailyTasks.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // working
        if segue.identifier == "newDetail" {
            rowChosen = -1
            if let destinationVC = segue.destination as? DailyPlannerDetailViewController {
                
                destinationVC.delegate = self
                
                
            }
        }
        else if segue.identifier == "EditDetail" {
            if let destinationVC = segue.destination as? DailyPlannerDetailViewController {
                
                destinationVC.delegate = self
                
                
            }
        }
    }
    
    func didUpdateNoteWithTimeInterval(newTime: String, andBody newBody: String) {
        //update the respective values

        
        print("data passed back?")
        print(rowChosen)
        if rowChosen == -1 {
            models.append([newTime, newBody])
            dailyTasks.beginUpdates()
        
            dailyTasks.insertRows(at: [
                NSIndexPath(row: models.count-1, section: 0) as IndexPath], with: .automatic)
        
            dailyTasks.endUpdates()
            print(models)
        }
        else {
            models[rowChosen] = [newTime, newBody]
            dailyTasks.beginUpdates()
            
//            dailyTasks.insertRows(at: [
//                NSIndexPath(row: rowChosen-1, section: 0) as IndexPath], with: .automatic)
            
            dailyTasks.endUpdates()
            print(models)
            
        }
        
        //refresh the view
        dailyTasks.reloadData()
    }
    
}
