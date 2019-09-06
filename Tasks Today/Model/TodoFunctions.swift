//
//  TodoFunctions.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/25/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation

class TodoFunctions {
    
    static func createTodos(at taskIndex: Int, todoModel: TodoModel){
        Data.taskModels[taskIndex].todoModels.append(todoModel)
    }

    static func deleteTodos(at taskIndex: Int, in todoIndex: Int){
         print(todoIndex)
         Data.taskModels[taskIndex].todoModels.remove(at: todoIndex)
    }
    
    static func addNotes(taskIndex: Int, todoIndex: Int, notes: String){
        Data.taskModels[taskIndex].todoModels[todoIndex].notes = notes
    }
    
    static func deleteTodayTodos(todoModel: TodoModel){
        for tasks in Data.taskModels.indices {
            for todos in Data.taskModels[tasks].todoModels.indices {
                print(Data.taskModels[tasks].todoModels[0])
                print("Its a match")
                if Data.taskModels[tasks].todoModels[todos].id == todoModel.id {
                    deleteTodos(at: tasks, in: todos)
                    break
                }
            }
        }
    }
}
