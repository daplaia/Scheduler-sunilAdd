//
//  classes.swift
//  Scheduler
//
//  Created by JIAJUN LIANG on 11/19/18.
//  Copyright © 2018 JIAJUN LIANG. All rights reserved.
//

import UIKit
import Foundation

// to be added by Yanxi
/*
class timelogs{
    var dateCreated: String
    var duration: float
    var parentTaskTitle: String
    var isInterrupted: Bool
    //methods set
    //methods get
}
*/


class Subtask {
    var title: String
    
// to be added by Yanxi
/*
    var timelogsPerTask: [timelogs]
    var totaltime: float
    var taskIsDone: Bool
    
    //methods:
    SortTimeLog(...){}
    calcTotalTime(...){}
    setTaskDone(...){}
    setTaskTitle(...){}
    clearLogs(...){}
    //get methods…
    getTaskProgress(){}
    getTimeLog(Last7days/Last14days/Last30days){}
*/
    init() {
        self.title = "Subtask title"
    }
}

// Question: do we need to add hour and minutes?
class Mydate {
    var month: Int
    var day: Int
    var year: Int
    
    init() {
        let cur_date = Date()
        let calendar = Calendar.current
        self.month = calendar.component(.month, from: cur_date)
        self.day = calendar.component(.day, from: cur_date)
        self.year = calendar.component(.year, from: cur_date)
    }
    
    // init with date in string
    init(month: String, day: String, year: String) {
        self.month = Int(month) ?? 1
        self.day = Int(day) ?? 1
        self.year = Int(year) ?? 2018
    }
}

// Need to add: more init() with parameters
class Task {
    var title: String
    var due_date: Mydate
    var details: String
    var subtasks: [Subtask]
    var note: String
    
    init() {
        self.title = "Task title"
        self.due_date = Mydate()
        self.details = "Task details"
        self.subtasks = [Subtask]()
        self.note = "Task note"
    }
}

// Need to add: more init() with parameters
class Schedule {
    var tasks: [Task]
    
    init() {
        self.tasks = [Task]()
    }
    
    init (ifGenerateTasks: Bool) {
        self.tasks = [Task]()
        
        if ifGenerateTasks {
            for _ in 0 ..< Int.random(in: 8 ..< 16) {
                self.tasks.append(Task())
            }
        }
    }
    
}


// ***To be finished: local storage
// Usage:
// Getting:
// Setting:
struct Storage {
    
    
    
//    static var phoneNumberInE164: String? {
//        get {
//            return UserDefaults.standard.string(forKey: "phoneNumberInE164")
//        }
//
//        set(phoneNumberInE164) {
//            UserDefaults.standard.set(phoneNumberInE164, forKey: "phoneNumberInE164")
//            print("Saving phone number was \(UserDefaults.standard.synchronize())")
//        }
//    }
    
}
