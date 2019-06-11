//
//  ViewController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/8/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITextFieldDelegate {

    let homeView = HomeView()
    let dataSource = ProjectDataSource()
//    let delegate = ProjectDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        homeView.textField.delegate = self
        homeView.taskCollectionView.dataSource = dataSource
        homeView.todayTableView.dataSource = dataSource
    }
    
    override func loadView() {
        view = homeView
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        print("Hello")
        return false
    }
}

