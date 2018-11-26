//
//  SubTaskClass.swift
//  timerScene
//
//  Created by 李妍溪 on 2018/11/20.
//  Copyright © 2018年 Jess. All rights reserved.
//

import Foundation
import UIKit

class SubTask: UIViewController{
    var taskName: String = "Default"
    var isDone: Bool = false
    var TimeLogRecords : [TimerLogs] = []
    /*init()
    {
        self.taskName = ""
        self.isDone = false
        self.TimeLogRecords = [TimerLogs]()
    }
    */
    func retrievePastRecord(by Period: String) {
    
    }
    
    func insertRecord(date: Date)
    {
        
    }
    
    func SetTaskIsDone()
    {
        self.isDone = true
    }
    
    func SetTaskIsNotDone()
    {
        self.isDone = false
    
    }
    
    func TaskState() -> Bool
    {
        let state = self.isDone
        return state
    }
    
    func setTaskName(name: String)
    {
        self.taskName = name
    }
    
    func getTaskName() -> String
    {
        let name = self.taskName
        return name
    }
    
    
}

class TimerLogs: UIViewController{
    var recordCreateDate: Date = Date()
    var SingleTimeRecord: Float = 0 //round up seconds to minutes
    var SessionIsTerminated: Bool = false
    
    //methods
    func SetTimeRecord(Seconds: Int)
    {
        self.SingleTimeRecord = Float(Seconds) / 60.0
    }
    
    func TerminateSession()
    {
        self.SessionIsTerminated = true
    }
    
    func SetDate(date:Date)
    {
        self.recordCreateDate = date
    }
    
    func getDate() -> Date
    {
        let date = self.recordCreateDate
        return date
    }
    
}
