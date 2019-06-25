//
//  TaskVC.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskVC: UIViewController, UITextFieldDelegate{
    let taskView = TaskView()
    let homeView = HomeView()
    var taskId: UUID!
    var taskIndex: Int!
    var taskModel: TaskModel?
    var text: String!
    var expandState = MockData.createExpandedData()
    var ctr = 0
    
    fileprivate func updatesTableViewWithData() {

        TaskFunctions.readTask(by: taskId) { [weak self] (model) in
            guard let self = self else { return }
            self.taskModel = model
            guard let model = model else { return }
            
            self.taskView.taskName.text = model.title
            self.taskView.taskTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatesTableViewWithData()
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        taskView.textField.delegate = self
        taskView.taskTableView.dataSource = self
        taskView.taskTableView.delegate = self
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
        taskView.deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        
        setTodo()
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
            TaskFunctions.deleteTasks(index: (self?.taskIndex)!)
            print(Data.taskModels.count)
            
//            self?.homeView.taskCollectionView.deleteItems(at: indexPaths)
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
    func setTodo() {
       taskView.selectorClosure = {
            self.view.endEditing(true)
            print("Selector called")
        
        guard let name =  self.taskView.textField.text else { return }
        //let date = self.taskView.datePicker.date
        if name != ""{
            let todoModel = TodoModel(title: name, date: "Today", notes: "", isChecked: false)
            
            TodoFunctions.createTodos(at: self.taskIndex, todoModel: todoModel)
            self.expandState.append(true)
            self.taskView.textField.text = ""
            print(todoModel)
            self.taskView.taskTableView.reloadData()
        }
        
    }
        
        self.taskView.setTodo()
    }
    
    @objc func expandSection(_ button: UIButton){
        let section = button.tag
        let indexPaths = IndexPath(row: 0, section: section)

        let isExpanded = expandState[section]
        expandState[section] = !isExpanded
        
        if isExpanded{
            taskView.taskTableView.insertRows(at: [indexPaths], with: .fade)
        } else{
            taskView.taskTableView.deleteRows(at: [indexPaths], with: .fade)
        }
    }
}

extension TaskVC: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        if let todoModels = taskModel?.todoModels.count {
            print(todoModels)
            return todoModels
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandState[section] {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskView.taskTableView.dequeueReusableCell(withIdentifier: taskView.cellId, for: indexPath) as! TaskTableCell
        
        cell.notesView.delegate = self
        cell.saveButton.addTarget(self, action: #selector(addingNotes), for: .touchUpInside)
        
        let model = taskModel?.todoModels[indexPath.section]
        cell.setup(model: model!)
        
        return cell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("First")
        print(textView.text!)
        text = textView.text!
    }
    
    @objc func addingNotes(_ button: UIButton){
        print("Attempting to add notes")
        
        let section = button.tag
        print(text ?? "nil")
        //        sectionItems[section].notes = "\(text ?? "")"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: taskView.headerId) as! TaskHeader
        let todoModel = taskModel?.todoModels[section]
        
        taskHeader.setup(model: todoModel!)
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
}





