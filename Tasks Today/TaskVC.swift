//
//  TaskVC.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskVC: UIViewController, UITextFieldDelegate, UITableViewDelegate{
    let taskView = TaskView()
    let homeView = HomeView()
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
        taskView.deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        
        addTodo()
    }
    
    override func loadView() {
        view = taskView
    }
    
    @objc func deleteTask(){
        print("attempting to delete task")
        let ac = UIAlertController(title: "Are you sure you want to delete this task?", message: nil, preferredStyle: .alert)
        let delete = UIAlertAction(title: "Delete", style: .default){ [weak self] _ in
            print("Deleting the item")
            
            var indexPaths = [IndexPath]()
            let section = 0
            for row in 0..<1{
                print(row)
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            print(Data.taskModels)
            TaskFunctions.deleteTasks(index: 0)
            print(Data.taskModels)
            
//            self?.homeView.taskCollectionView.deleteItems(at: indexPaths)
//            
//            
           // self?.homeView.taskCollectionView.reloadData()
            let home = HomeVC()
            self?.present(home, animated: true)
        }
        let cancel = UIAlertAction(title: "Canel", style: .cancel)
        
        
        
        ac.addAction(cancel)
        ac.addAction(delete)
        present(ac, animated: true)
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
                self.dataSource.sectionItems.append(ExpandableItems(isExpanded: true, todoItem: Todo(todoName: itemName, todoDate: date, isChecked: false), notes: ""))
            }
            self.taskView.taskTableView.reloadData()
            self.taskView.textField.text = ""
        }
        self.taskView.setTodo()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: taskView.headerId) as! TaskHeader
        let headerData = dataSource.sectionItems[section].todoItem
        taskHeader.headerData = headerData
        taskHeader.expandButton.tag = section
        taskHeader.expandButton.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
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
        } else{
            taskView.taskTableView.deleteRows(at: indexPaths, with: .fade)
        }
        
    }
}





