//
//  TaskVC.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskVC: UIViewController, UITextFieldDelegate {
    let taskView = TaskView()
    let dataSource = TaskDataSource()
    let delegate = TaskDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        taskView.textField.delegate = self
        taskView.taskTableView.dataSource = dataSource
        taskView.taskTableView.delegate = delegate
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    
    override func loadView() {
        view = taskView
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Screen edge swiped!")
            let home = HomeVC()
            present(home, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        print("Hello")
        guard let item = textField.text else { return false }
        if item != "" {
//            dataSource.tasks.append(Task(taskName: task, itemNumber: 0))
            print(item)
//            print(dataSource.tasks)
        }
//        homeView.taskCollectionView.reloadData()
        textField.text = ""
        return false
    }
}
