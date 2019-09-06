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
                Data.taskModels = MockData.createMockTaskData()
                for index in Data.taskModels {
                    print(index)
                }
            }
            DispatchQueue.main.async {
                //Once that code gets retrieved the completion function gets called
                completion()
            }
        }
    }
    
    static func readTask(by id: UUID, completion: @escaping(TaskModel?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            let task = Data.taskModels.first(where: { $0.id == id })
            
            DispatchQueue.main.async {
                //Once that code gets retrieved the completion function gets called
                completion(task)
            }
        }
    }
    
    static func deleteTasks(index: Int){
        Data.taskModels.remove(at: index)
    }
}
