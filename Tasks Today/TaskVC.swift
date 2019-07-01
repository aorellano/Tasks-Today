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
    var taskId: UUID!
    var taskIndex: Int!
    var taskModel: TaskModel?
    var text: String!
    var closure: (() -> ())?
    var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
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
    
    fileprivate func loadData() {
        TaskFunctions.readTask(by: taskId) { [weak self] (model) in
            guard let self = self else { return }
            self.taskModel = model
            guard let model = model else { return }
            
            self.taskView.taskName.text = model.title
            self.taskView.taskTableView.reloadData()
        }
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
        let date = self.taskView.datePicker.date
        if name != ""{
            let todoModel = TodoModel(title: name, date: date, notes: "", isChecked: false, isExpanded: true)
            
            TodoFunctions.createTodos(at: self.taskIndex, todoModel: todoModel)
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

        let isExpanded = taskModel?.todoModels[section].isExpanded
        taskModel?.todoModels[section].isExpanded = (!isExpanded!)
        if isExpanded!{
            taskView.taskTableView.insertRows(at: [indexPaths], with: .fade)
            saveButton.isHidden = true
        } else{
            taskView.taskTableView.deleteRows(at: [indexPaths], with: .fade)
        }
    }
    
    @objc func itemCompleted(_ button: UIButton){
        let section = button.tag
        let todos = taskModel?.todoModels[section]

        button.isSelected = !button.isSelected
        
        if let cell = taskView.taskTableView.headerView(forSection: section) as? TaskHeader {
            UIView.animate(withDuration: 0.8, delay: 0.6, animations: {
                
                cell.titleLabel.attributedText = self.strikeThroughText((todos?.title)!)
                self.taskView.taskTableView.beginUpdates()
                TodoFunctions.deleteTodos(at: self.taskIndex, in: section)
                self.taskView.taskTableView.deleteSections([section], with: UITableView.RowAnimation.automatic)
                
                self.taskView.taskTableView.endUpdates()
            }, completion: { (success) in
                
                
                self.taskView.taskTableView.reloadData()
                
            })
            print((todos?.title)!)
            
        }
    }
    
    func strikeThroughText(_ text: String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

extension TaskVC: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        if let todoModels = taskModel?.todoModels.count {
            return todoModels
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Bug that there is default 4 expandable items
        if (taskModel?.todoModels[section].isExpanded)! {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskView.taskTableView.dequeueReusableCell(withIdentifier: taskView.cellId, for: indexPath) as! TaskTableCell
        
        cell.notesView.delegate = self
        
        cell.saveButton.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        cell.saveButton.tag = indexPath.section
        
        let model = taskModel?.todoModels[indexPath.section]
        cell.setup(model: model!)
        
        saveButton = cell.saveButton
        return cell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        text = textView.text!
        saveButton.editingLayout()
    }
    
    
    @objc func saveNote(_ button: UIButton){
        let section = button.tag
        button.pulse()
        button.savedLayout()
        TodoFunctions.addNotes(taskIndex: taskIndex, todoIndex: section, notes: text)
    }
    
    func buttonAction(_ button : UIButton){
        print("Next")
        print(button)
        
        //button.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: TaskView.headerId) as! TaskHeader
        let todoModel = taskModel?.todoModels[section]
        
        taskHeader.setup(model: todoModel!)
        taskHeader.expandButton.tag = section
        taskHeader.expandButton.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        taskHeader.checkBox.tag = section
        taskHeader.checkBox.addTarget(self, action: #selector(itemCompleted), for: .touchUpInside)

        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
}





