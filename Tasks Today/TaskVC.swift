//
//  TaskVC.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskVC: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    let taskView = TaskView()
    let dataSource = TaskDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        taskView.textField.delegate = self
        taskView.taskTableView.dataSource = dataSource
        taskView.taskTableView.delegate = self
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
        taskView.selectorClosure = { print("Selector called") }
        taskView.setTodo()
    }
    
    override func loadView() {
        view = taskView
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            let home = HomeVC()
            present(home, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        guard let item = textField.text else { return false }
        if item != "" {
            //taskView.setTodo()
            dataSource.todoItems.append(Todo(taskName: item, isChecked: false))
//            let todo = Todo(taskName: item, isChecked: false)
//            dataSource.sectionItems.append(ExpandableItems(isExpanded: false, todoItems:[todo]))
//            
            //dataSource.todoItems.append(Todo(taskName: item, isChecked: false))
            //dataSource.sectionItems[0].todoItems.append(Todo(taskName: item, isChecked: false))
            //dataSource.sectionItems[0].isExpanded = false
            //dataSource.todoItems.append(Todo(taskName: item, isChecked: false))
            //var todo = Todo(taskName: item, isChecked: false)
            //dataSource.sectionItems.append(ExpandableItems(isExpanded: false, todoItems: [todo]))
            //dataSource.items.append(Todo(isExpanded: false, checkbox: true, taskNames: [item], date: Date))
            //print((dataSource.sectionItems) )
            print("textField")
            print(dataSource.todoItems)
            //print(dataSource.sectionItems.count)
        }
        taskView.taskTableView.reloadData()
        textField.text = ""
        return false
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: taskView.headerId) as! TaskHeader
        print("Out of order index")
        print(dataSource.todoItems.count)
        print()
                let headerData = dataSource.todoItems
                taskHeader.headerData = headerData[section]
        
        //        let headerData = dataSource.todoItems[section]
        //        taskHeader.headerData = headerData
        
        taskHeader.expandButton.tag = section
        //taskHeader.itemLabel.text = todoItems[section].taskName
        taskHeader.expandButton.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        //        subjectHeader.expandButton.tag = section
        //        subjectHeader.subjectLabel.text = subjects[section]
        //        subjectHeader.addButton.tag = section
        //        subjectHeader.expandButton.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        //        subjectHeader.addButton.addTarget(self, action: #selector(createItem), for: .touchUpInside)
        
        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    @objc func expandSection(_ button: UIButton){
        print("Section Header Pressed")
        let section = button.tag
        var indexPaths = [IndexPath]()
        
        for row in dataSource.sectionItems[section].todoItems.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = dataSource.sectionItems[section].isExpanded
        dataSource.sectionItems[section].isExpanded = !isExpanded
        
        if isExpanded{
            taskView.taskTableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            taskView.taskTableView.insertRows(at: indexPaths, with: .fade)
        }
    }
}

