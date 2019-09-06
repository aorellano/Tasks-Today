//
//  TaskView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskView: UIView {
    let cellId = "taskCell"
    static let headerId = "sectionHeader"
    let textField = CustomTextField()
    var taskName = CustomLabel()
    var datePicker = UIDatePicker()
    var selectorClosure: (() -> Void)?
    
    var taskTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.layer.cornerRadius = 10.0
        tableView.clipsToBounds = true
        tableView.separatorColor = .clear
        tableView.backgroundColor = Theme.current.background
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.titleLabel?.font = (Theme.mainFontName?.withSize(12))
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(TaskController.deleteTask), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Theme.current.background
        
        textField.attributedPlaceholder = NSAttributedString(string: "Enter todo",attributes: [NSAttributedString.Key.foregroundColor: Theme.current.tint])
        textField.inputAccessoryView = firstInputView()
        taskTableView.register(TaskTableCell.self, forCellReuseIdentifier: cellId)
        taskTableView.register(TaskHeader.self, forHeaderFooterViewReuseIdentifier: TaskView.headerId)
        
        textFieldConstraints()
        taskNameConstraints()
        deleteButtonConstraints()
        taskTableViewConstraints()
    }
    
    func textFieldConstraints() {
        self.addSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func taskNameConstraints() {
        self.addSubview(taskName)
        taskName.text = "T a s k"
        taskName.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25).isActive = true
        taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func taskTableViewConstraints(){
        self.addSubview(taskTableView)
        taskTableView.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 25).isActive = true
        taskTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        taskTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
        taskTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func deleteButtonConstraints() {
        self.addSubview(deleteButton)
        
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: taskName.centerYAnchor).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
    }
    
    func firstInputView() -> UIToolbar {
        let dateButton = UIBarButtonItem(title: "Date", style: .plain, target: self, action: #selector(presentDatePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let bar = UIToolbar()
        bar.setItems([flexibleSpace, dateButton], animated: true)
        bar.sizeToFit()
        return bar
    }
    
    func secondInputView() -> UIToolbar {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(switchKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(setTodo))
        let bar = UIToolbar()
        bar.setItems([backButton, flexibleSpace, doneButton], animated: true)
        bar.sizeToFit()
        return bar
    }
    
    @objc func presentDatePicker() {
        textField.inputView = datePicker
        textField.inputAccessoryView = secondInputView()
        textField.reloadInputViews()
    }
    
    @objc func switchKeyboard(){
        textField.inputView = nil
        textField.inputAccessoryView = firstInputView()
        textField.reloadInputViews()
    }
    
    @objc func setTodo() {
        print("Trying to set the todo")
        self.selectorClosure?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

