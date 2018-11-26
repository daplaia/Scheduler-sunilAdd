//
//  DailyPlannerDetailViewController.swift
//  DailyPlanner4
//
//  Created by Hanxing Zhang on 2018/11/19.
//  Copyright © 2018 Hanxing Zhang. All rights reserved.
//

import UIKit

protocol NoteViewDelegate {
    
    //the name of the function that will be implemented
    func didUpdateNoteWithTimeInterval(newTime : String, andBody newBody :
        String)
    
}


class DailyPlannerDetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var startTime: UIDatePicker!
    
    
    @IBOutlet weak var finishTime: UIDatePicker!
    
    
    @IBOutlet weak var notesDetail: UITextField!
    
    var dataInDetailView:[String] = ["", ""]
    var startTimeString = ""
    var finishTimeString = ""
    var notesWritten = ""
    var delegate : NoteViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTime.datePickerMode = UIDatePicker.Mode.time // 4- use time only
        finishTime.datePickerMode = UIDatePicker.Mode.time
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getStartTime(_ sender: Any) {
        let dateFormatter = DateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "h:mm a"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.string(from: startTime.date)
        // Finally we set the text of the label to our new string with the date
        startTimeString = strDate
    }
    
    
    @IBAction func getFinishTime(_ sender: Any) {
        let dateFormatter = DateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "h:mm a"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.string(from: finishTime.date)
        // Finally we set the text of the label to our new string with the date
        finishTimeString = strDate
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        notesWritten = notesDetail?.text ?? ""
        dataInDetailView = [startTimeString+" to "+finishTimeString, notesWritten]
        notesDetail.text = startTimeString+" to "+finishTimeString + " " + notesWritten
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        getStartTime("")
        getFinishTime("")
        notesWritten = notesDetail?.text ?? ""
        super.viewWillDisappear(animated)
        if self.delegate != nil {
            dataInDetailView = [startTimeString+" to "+finishTimeString, notesWritten]
            self.delegate!.didUpdateNoteWithTimeInterval(
                newTime: startTimeString+" to "+finishTimeString, andBody: notesWritten)
            
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
//        notesWritten = notesDetail?.text ?? ""
//        dataInDetailView = [startTimeString+" to "+finishTimeString, notesWritten]
//
        
        
//        getStartTime("")
//        getFinishTime("")
//        notesWritten = notesDetail?.text ?? ""
//        if self.delegate != nil {
//            dataInDetailView = [startTimeString+" to "+finishTimeString, notesWritten]
//            self.delegate!.didUpdateNoteWithTimeInterval(
//                newTime: startTimeString+" to "+finishTimeString, andBody: notesWritten)
//        
//        }
    }
    
}
