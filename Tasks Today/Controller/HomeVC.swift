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
//Change edit button to say edit then done when person starts typing
//also change the color
class HomeVC: UIViewController, UITextFieldDelegate{

    let homeView = HomeView()
    let collectioCell = TaskCollectionCell()
    var todayTodos = [TodoModel]()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hi")
        loadData()
        
//        TaskFunctions.readTasks(completion: { [weak self] in
//            //This code is going to get passed into the readTasks function
//            self?.homeView.taskCollectionView.reloadData()
//        })
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        homeView.textField.delegate = self
        homeView.taskCollectionView.dataSource = self
        homeView.todayTableView.dataSource = self
        homeView.taskCollectionView.delegate = self
        homeView.todayTableView.delegate = self
    }
    
    override func loadView() {
        view = homeView
    }
    
    fileprivate func loadData() {
        TaskFunctions.readTasks(completion: { [weak self] in
            for taskIndex in Data.taskModels.indices {
                for todoIndex in Data.taskModels[taskIndex].todoModels.indices{
                    if self?.dateFormatter.string(from: Data.taskModels[taskIndex].todoModels[todoIndex].date) == self?.dateFormatter.string(from: Date()) {
                        self?.todayTodos.append(Data.taskModels[taskIndex].todoModels[todoIndex])
                    }
                }
            }
           
//            guard let self = self else { return }
//            self.taskModel = model
//            guard let model = model else { return }
            
            self?.homeView.taskCollectionView.reloadData()
            self?.homeView.todayTableView.reloadData()
            self?.checkArray()
        }
    )}
    
    func checkArray() {
        print(todayTodos)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.backgroundColor = .white
        textField.placeholder = "Enter Task"

        if textField.hasValue {
            TaskFunctions.createTask(taskModel: TaskModel(title: textField.text!, itemNumbers: 0))
            homeView.taskCollectionView.reloadData()
            textField.text = ""
        }
        return false
    }
}
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.taskModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.taskCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.collectionCellId, for: indexPath) as! TaskCollectionCell
        
        cell.setup(taskModel: Data.taskModels[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let taskVC = TaskVC()
        let task = Data.taskModels[indexPath.row]
        taskVC.taskId = task.id
        taskVC.taskIndex = indexPath.row
        print("Going to next viewcontroller")
        self.present(taskVC, animated: true)
    }
}
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return todayTodos.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todayTodos.count)
        //return todayTodos.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.todayTableView.dequeueReusableCell(withIdentifier: homeView.tableViewCellId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = homeView.todayTableView.dequeueReusableHeaderFooterView(withIdentifier: homeView.headerViewId) as! TaskHeader
        let todoModel = todayTodos[section]
        taskHeader.setup(model: todoModel)
        
        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
    

}

