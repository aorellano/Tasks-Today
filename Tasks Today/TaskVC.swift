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
        
        addTodo()
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

    func addTodo() {
        taskView.selectorClosure = {
            self.view.endEditing(true)
            print("Selector called")
            let itemName = self.taskView.textField.text ?? "Blank"
            let date = self.taskView.datePicker.date as NSDate
            if itemName != "" {
                print(itemName)
                //self.dataSource.todoItems.append(Todo(taskName: itemName, isChecked: false))
                self.dataSource.sectionItems.append(ExpandableItems(isExpanded: true, todoItem: Todo(taskName: itemName, isChecked: false), todoDate: date))
            }
            self.taskView.taskTableView.reloadData()
            self.taskView.textField.text = ""
            
        }
        
        self.taskView.setTodo()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: taskView.headerId) as! TaskHeader
        print("Out of order index")
        print(dataSource.todoItems.count)
        
        let headerData = dataSource.sectionItems[section].todoItem
                //let headerData = dataSource.todoItems
        taskHeader.headerData = headerData
        
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
        
        for row in 0..<1{
            print(row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = dataSource.sectionItems[section].isExpanded
        dataSource.sectionItems[section].isExpanded = !isExpanded
        print(isExpanded)
        
        if isExpanded{
            taskView.taskTableView.insertRows(at: indexPaths, with: .fade)
            //taskView.taskTableView.reloadData()
        } else{
            taskView.taskTableView.deleteRows(at: indexPaths, with: .fade)
            //taskView.taskTableView.reloadData()
        }
        
        
    }
}





