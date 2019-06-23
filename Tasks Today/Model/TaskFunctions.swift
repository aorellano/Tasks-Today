//
//  TaskFunctions.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/22/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation

class TaskFunctions {
    static func createTask(taskModel: TaskModel){
        Data.taskModels.append(taskModel)
    }
    
    static func readTasks(completion: @escaping () -> ()){
        //Gets loaded on the background thread so it doesnt slow the UICode down
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.taskModels.count == 0 {
                Data.taskModels.append(TaskModel(title: "Project", itemNumbers: 5))
                Data.taskModels.append(TaskModel(title: "School", itemNumbers: 0))
                Data.taskModels.append(TaskModel(title: "Blog", itemNumbers: 2))
            }
            DispatchQueue.main.async {
                //Once that code gets retrieved the completion function gets called
                completion()
            }
        }
    }
    
    static func updateTasks(taskModel: TaskModel){
        
    }
    
    static func deleteTasks(taskModel: TaskModel){
        
    }
}
