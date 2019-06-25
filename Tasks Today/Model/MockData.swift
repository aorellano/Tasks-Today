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
        mockTodos.append(TodoModel(title: "Create wireframe for app", date: "Today", notes: "", isChecked: false))
        mockTodos.append(TodoModel(title: "Choose font", date: "Today", notes: "", isChecked: false))
        mockTodos.append(TodoModel(title: "Choose color scheme", date: "Tommorrow", notes: "", isChecked: false))
        mockTodos.append(TodoModel(title: "Add additional features", date: "Saturday", notes: "", isChecked: false))
        return mockTodos
    }
    
    static func createExpandedData() -> [Bool] {
        let size = createMockTodoData().count
        var expandedItems = [Bool](repeating: true, count: size)
        return expandedItems
    }
}
