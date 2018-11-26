//
//  ToDoListView.swift
//  timerScene
//
//  Created by 李妍溪 on 2018/11/21.
//  Copyright © 2018年 Jess. All rights reserved.
//

import Foundation
import UIKit

protocol ToggleCheckBox{
    
    func ToggleCheckBox(state: Bool, index: Int?)
    
}


class ToDoListCell: UITableViewCell,UITextFieldDelegate{
    
    //MAKE THEM OPTIONALS AS WAYS OF INITIALIZATION
    var indexPath: Int?
    var SubTasks: [SubTask]?
    var CBdelegate: ToggleCheckBox?
  
  
    @IBOutlet weak var UserTaskName: UILabel!

    @IBOutlet weak var CheckBoxImage: UIButton!
    
    

    @IBAction func ClickOnCheckBox(_ sender: UIButton) {
       
        let task = SubTasks?[indexPath ?? 0] ?? nil
        if(task == nil){
            
            print("isNil")
            return
            
        }
        else{
            if(task?.TaskState() == true)
            {
                print("toggleToFalse")
                CBdelegate?.ToggleCheckBox(state: true, index: indexPath)
            }
            
            else{
                
                print("toggleToTrue")
                CBdelegate?.ToggleCheckBox(state: false, index: indexPath)
            }
                
                
            }
            
        
    }
    
  
    
}

class ToDoListViewController: UIViewController,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, ToggleCheckBox{

   // @IBOutlet weak var textviewPlaceholder: UILabel!
    /*
    @objc func placeHolderTapped( _ sender: UITapGestureRecognizer) {
        textviewPlaceholder.isHidden = true
        //NameTextField.text = UserName.text
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       
        
        return true
    }
    
    func infoAlert(){
        
        if (SubTasks.count != 0){
            let sheet = UIAlertController(title: "Clear your list", message: "This will delete all your tasks.", preferredStyle: UIAlertController.Style.actionSheet
            )
            let ActionYes =  UIAlertAction(title: "Clear", style: .default){ (action) in
                self.SubTasks = []
                self.tableView.reloadData()
            }
            
            let ActionCancel = UIAlertAction(title: "Cancel", style: .cancel){(_) in
                
            }
            
            sheet.addAction(ActionYes)
            sheet.addAction(ActionCancel)
            self.present(sheet, animated: true, completion: nil)
        
        }
        
        else{
       
            let sheet = UIAlertController(title: "Reminder", message: "Your list is already empty.", preferredStyle: UIAlertController.Style.actionSheet
            )
          
            let ActionCancel = UIAlertAction(title: "Ok", style: .cancel){(_) in
                
            }
        
            sheet.addAction(ActionCancel)
            self.present(sheet, animated: true, completion: nil)
        
        }
        
        
        
        
    }
    var selectedIndexPath: IndexPath? = nil
 
    
    var SubTasks: [SubTask] = []  //IMPORTANT: OVERRIDE THIS WITH CLASS TASK.SUBTASKS LATER AND WITH COREDATA METHOD
    
    @IBOutlet weak var addNewCellButton: UIBarButtonItem!
    
    @IBAction func EditCellName(_ sender: UIBarButtonItem) {
        if(selectedIndexPath == nil){
            return
        }
        let task  = SubTasks[(selectedIndexPath?.row) ?? 0]
        let alertController = UIAlertController(title: "Edit Task", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            if(task.getTaskName() == ""){
            textField.placeholder = "Enter task name"
            }
            else{
                textField.placeholder = task.getTaskName()
            }
        }
        let saveAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let UserTextField = alertController.textFields![0] as UITextField
            task.setTaskName(name: UserTextField.text ?? "Untitled")
            
            self.SubTasks[self.selectedIndexPath?.row ?? 0] = task
            self.CellToolBar.isHidden = true
            self.selectedIndexPath = nil
            self.tableView.reloadData()
            
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        

    
        
    }
    @IBAction func addNewCell(_ sender: UIBarButtonItem) {
        let task = SubTask()
        let alertController = UIAlertController(title: "Add Task", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter task name:"
            
        }
        let saveAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let UserTextField = alertController.textFields![0] as UITextField
            task.setTaskName(name: UserTextField.text ?? "Untitled")
            
            self.SubTasks.append(task)
            self.CellToolBar.isHidden = true
            self.selectedIndexPath = nil
            self.tableView.reloadData()
            
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (action : UIAlertAction!) -> Void in })
       
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
      
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete)
        {
            SubTasks.remove(at: indexPath.row)
        }
        
        tableView.reloadData()
    }
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "To Do List"
    }
    
    
    @IBOutlet weak var CellToolBar: UIToolbar!
    @IBOutlet weak var DeleteCellButton: UIBarButtonItem!
    
    
    @IBAction func DeleteAllCells(_ sender: UIBarButtonItem){
         infoAlert()
    
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath {
            // it was already selected
            print("deselect")
            CellToolBar.isHidden = true
            selectedIndexPath = nil
            tableView.deselectRow(at: indexPath, animated: false)
        } else {
            print("select")
            // wasn't yet selected, so let's remember it
            selectedIndexPath = indexPath
            CellToolBar.isHidden = false
        }
     
    }
    


    
    func ToggleCheckBox(state: Bool, index: Int?) {
        if (index == nil)
        {
            print("IndexNil")
            return
        }
    
        if (SubTasks != []){
            print("current\(state)")
            
            state ? SubTasks[index!].SetTaskIsNotDone() : SubTasks[index!].SetTaskIsDone()
            print("after:\(SubTasks[index!].TaskState())")
            tableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableView.RowAnimation.none)
        }
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubTasks.count
    }
    
    /*
    @objc func placeHolderTapped( _ sender: UITapGestureRecognizer) {
        if (selectedIndexPath == nil){
            print("is nil")
            return
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: selectedIndexPath!) as! ToDoListCell
        cell.UserTaskNameTextfield.isHidden = false
        cell.UserTaskName.isHidden = true
        
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (selectedIndexPath == nil){
            return false
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: selectedIndexPath!) as! ToDoListCell
        textField.resignFirstResponder()
        cell.UserTaskName.text = cell.UserTaskNameTextfield.text
        cell.UserTaskName.isHidden = false
        cell.UserTaskNameTextfield.isHidden = true
        
        self.view.endEditing(true)
        return true
    }
    */
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath) as! ToDoListCell
        
        
        let OneSubTask = SubTasks[indexPath.row]
        print("OneSubTaskState \(OneSubTask.TaskState())")
        cell.UserTaskName.text = OneSubTask.getTaskName()
        
        if OneSubTask.TaskState() == true {
            let checkImg = UIImage(named: "checked.PNG") as UIImage?
            
        cell.CheckBoxImage.setBackgroundImage(checkImg, for: UIControl.State.normal)
        }
        
        else {
            let uncheckImg = UIImage(named: "unchecked.PNG") as UIImage?
            
            cell.CheckBoxImage.setBackgroundImage(uncheckImg, for: UIControl.State.normal)
        }
        
        //Add tapgestures
        
      
       /* cell.UserTaskNameTextfield.isUserInteractionEnabled = true
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ToDoListViewController.placeHolderTapped)) //ClassName.ojbfuncName
        //let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        cell.UserTaskName.addGestureRecognizer(tapGesture)*/
        // Do any additional setup after loading the view, typically from a nib.
      
        
     
      
       
        cell.UserTaskName.text = OneSubTask.getTaskName()
        cell.CBdelegate = self
        cell.SubTasks =  SubTasks
        cell.indexPath = indexPath.row
       // cell.UserTaskNameTextfield.delegate = self
        
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        tableView.dataSource = self
        tableView.delegate = self
        CellToolBar.isHidden = true
        
        /*
        textviewPlaceholder.isUserInteractionEnabled = true
        if(NotePadTextView.text == "")
        {
            textviewPlaceholder.isHidden = false
        }
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ToDoListViewController.placeHolderTapped)) //ClassName.ojbfuncName
        //let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
    textviewPlaceholder.addGestureRecognizer(tapGesture)*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    



}


class PopUpViewController: UIViewController{
    
    
    var notes = ""
    @IBOutlet weak var NotePad: UITextView!
   
    
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    
    @IBAction func dismissButtonAction(_ sender:
        UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = NotePad.text
        
    }
    
    class PopUpTextFieldViewController: UIViewController{
        
        override func viewDidLoad() {
            super.viewDidLoad()

            
        }
        
    }
    
}
