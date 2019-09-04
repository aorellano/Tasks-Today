//
//  TaskController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/14/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskController: UIViewController, UITextFieldDelegate{
    let taskView = TaskView()
    var taskId: UUID!
    var taskIndex: Int!
    var taskModel: TaskModel?
    var text: String!
    var closure: (() -> ())?
    var saveButton: UIButton!
    var notesView: UITextView!
    
    var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        view.backgroundColor = Theme.current.background
        
        taskView.textField.delegate = self
        taskView.taskTableView.dataSource = self
        taskView.taskTableView.delegate = self
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func deleteTask(){
        print("attempting to delete task")
        let ac = UIAlertController(title: "Are you sure you want to delete this task?", message: nil, preferredStyle: .alert)
        let delete = UIAlertAction(title: "Delete", style: .default){ [weak self] _ in
            var indexPaths = [IndexPath]()
            let section = 0
            for row in 0..<1{
                print(row)
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            TaskFunctions.deleteTasks(index: (self?.taskIndex)!)
            let home = HomeController()
            self?.present(home, animated: true)
        }
        let cancel = UIAlertAction(title: "Canel", style: .cancel)
        
        ac.addAction(cancel)
        ac.addAction(delete)
        present(ac, animated: true)
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            let home = HomeController()
            home.modalTransitionStyle = .flipHorizontal
            present(home, animated: true)
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                //right view controller
                let newViewController = HomeController()
                present(newViewController, animated: false)
            //self.navigationController?.pushViewController(newViewController, animated: true)
            case UISwipeGestureRecognizer.Direction.left:
                //left view controller
                let newViewController = HomeController()
                present(newViewController, animated: false)
            //self.navigationController?.pushViewController(newViewController, animated: true)
            default:
                break
            }
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                    let ac = UIAlertController(title: "Todo Added!", message: nil, preferredStyle: .alert)
                    self.present(ac, animated: true)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        ac.dismiss(animated: true)
                    }
                }
                
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
            taskView.taskTableView.scrollToRow(at: indexPaths, at: .bottom, animated: true)
        } else{
            self.taskView.taskTableView.deleteRows(at: [indexPaths], with: .fade)
        }
        
        
        
        
        self.taskView.taskTableView.beginUpdates()
        
        self.taskView.taskTableView.reloadData()
        
        
        //myTableView.reloadRows(at: [indexPath], with: .automatic)
        
        self.taskView.taskTableView.endUpdates()
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

extension TaskController: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
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
        
        notesView = cell.notesView
        NotificationCenter.default.addObserver(self, selector: #selector(self.textFieldAppeared(notification:_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.textFieldDissapeared(notification:_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        cell.saveButton.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        cell.saveButton.tag = indexPath.section
        
        let model = taskModel?.todoModels[indexPath.section]
        cell.setup(model: model!)
        
        saveButton = cell.saveButton
        return cell
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.frame.origin.y = -175
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        text = textView.text!
        saveButton.editingLayout()
    }
    
    @objc func textFieldAppeared(notification: Notification, _ textView: UITextView){
        //Identify which textview is being used
        //Set the bottom of the textview to be the top of the keyboard
        let userInfo = notification.userInfo!
        let keyboardEndFrameCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardEndFrame = self.view.convert(keyboardEndFrameCoordinates, to: view.window)
        //self.view.frame.origin.y = -(keyboardFrame.size.height)
        
        if notification.name == UIResponder.keyboardWillHideNotification{
            notesView.contentInset = UIEdgeInsets.zero
            
        } else {
            notesView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (keyboardEndFrame.height/2), right: 0)
            notesView.scrollIndicatorInsets = notesView.contentInset
            
        }
        
        notesView.scrollRangeToVisible(notesView.selectedRange)
        
    }
    
    @objc func textFieldDissapeared(notification: Notification, _ textView: UITextView) {
        self.view.frame.origin.y = 0
        
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
