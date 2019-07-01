//
//  MockData.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/24/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation

class MockData {
    static func createMockTaskData() -> [TaskModel] {
        var mockTasks = [TaskModel]()
        mockTasks.append(TaskModel(title: "Project", itemNumbers: 5, todoModels: createMockTodoData()))
        mockTasks.append(TaskModel(title: "School", itemNumbers: 0))
        mockTasks.append(TaskModel(title: "Blog", itemNumbers: 2))
        
        return mockTasks
    }
    
    static func createMockTodoData() -> [TodoModel] {
        var mockTodos = [TodoModel]()
        mockTodos.append(TodoModel(title: "Create wireframe for app", date: Date(), notes: "", isChecked: false, isExpanded: true))
        mockTodos.append(TodoModel(title: "Create home screen", date: Date(), notes: "", isChecked: false, isExpanded: true))
        mockTodos.append(TodoModel(title: "Create theme for app", date: Date(), notes: "", isChecked: false, isExpanded: true))
        mockTodos.append(TodoModel(title: "Choose font", date: Date().add(days: 1), notes: "", isChecked: false, isExpanded: true))
        mockTodos.append(TodoModel(title: "Choose color scheme", date: Date().add(days: 2), notes: "", isChecked: false, isExpanded: true))
        mockTodos.append(TodoModel(title: "Add additional features", date: Date().add(days: 3), notes: "", isChecked: false, isExpanded: true))
        return mockTodos
    }

}
