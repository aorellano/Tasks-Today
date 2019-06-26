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

    static func readTodos(){
    
    }
    
    static func updateTodos(){
        
    }
    
    static func deleteTodos(){
        
    }
    
    static func addNotes(taskIndex: Int, todoIndex: Int, notes: String){
        Data.taskModels[taskIndex].todoModels[todoIndex].notes = notes
    }
    
}
