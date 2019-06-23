//
//  ViewController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/8/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit
//Simple Theme
//main font, background color, accent color, tint color
class HomeVC: UIViewController, UITextFieldDelegate, UICollectionViewDelegate {

    let homeView = HomeView()
    let dataSource = HomeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskFunctions.readTasks(completion: { [weak self] in
            //This code is going to get passed into the readTasks function
            self?.homeView.taskCollectionView.reloadData()
        })
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        homeView.textField.delegate = self
        homeView.taskCollectionView.dataSource = dataSource
        homeView.todayTableView.dataSource = dataSource
        homeView.taskCollectionView.delegate = self
        
    }
    
    override func loadView() {
        view = homeView
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.backgroundColor = .white
        textField.placeholder = "Enter Task"
        guard let task = textField.text else { return false }
        if task != "" {
            TaskFunctions.createTask(taskModel: TaskModel(title: task, itemNumbers: 0))
//            Data.taskModels.append(TaskModel(title: task, itemNumbers: 0))
//            print(Data.taskModels)
            homeView.taskCollectionView.reloadData()
            textField.text = ""
        } else {
            textField.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 160/255, alpha: 1)
            textField.placeholder = "Invalid entry"
        }
        
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let taskVC = TaskVC()
        print("Going to next viewcontroller")
        self.present(taskVC, animated: true)
    }
}

