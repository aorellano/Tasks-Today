//
//  ViewController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/8/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITextFieldDelegate, UICollectionViewDelegate {

    let homeView = HomeView()
    let dataSource = HomeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print("Hello")
        guard let task = textField.text else { return false }
        if task != "" {
            dataSource.tasks.append(Task(taskName: task, itemNumber: 0))
            print(task)
            print(dataSource.tasks)
        }
        homeView.taskCollectionView.reloadData()
        textField.text = ""
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let taskVC = TaskVC()
        self.present(taskVC, animated: true)
    }
}

