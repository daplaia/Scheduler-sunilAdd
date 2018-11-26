//
//  File.swift
//  ThreeSceneIncludingCoreData
//
//  Created by 李妍溪 on 2018/11/21.
//  Copyright © 2018年 Jess. All rights reserved.
//

import Foundation
import UIKit

class Task
{
    var notes: String = ""
    var subTasks: [SubTask] = []
    var createDate: Date = Date()
    var DaysLeft: Int = 0
    var DueDate: Date = Date()
    
    func setNotes(notes: String)
    {
        self.notes = notes
    }
    
    func getNotes(notes: String) -> String
    {
        let notes = self.notes
        return notes
    }
    
    func retrieveSubtasks() -> [SubTask]
    {
        let subtasks = self.subTasks
        return subtasks
    }
    
    func loadSubtasks(subTasks: [SubTask])
    {
        self.subTasks = subTasks
    }
    
    





}
