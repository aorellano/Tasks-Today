//
//  ViewController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/8/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITextFieldDelegate{
    let homeView = HomeView()
    let collectionCell = TaskCollectionCell()
    
    var todayTodos = [TodoModel]() {
        didSet {
            todayTodos = todayTodos.sorted(by: {$0.date < $1.date})
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        protocolSetups()
        loadData()
    }
    
    override func loadView() {
        view = homeView
    }
    
    func protocolSetups() {
        homeView.textField.delegate = self
        homeView.taskCollectionView.dataSource = self
        homeView.todayTableView.dataSource = self
        homeView.taskCollectionView.delegate = self
        homeView.todayTableView.delegate = self
    }
    
    fileprivate func loadData() {
        TaskFunctions.readTasks(completion: { [weak self] in
            
            for taskIndex in Data.taskModels.indices {
                for todoIndex in Data.taskModels[taskIndex].todoModels.indices{
                    if self?.homeView.dateFormatter.string(from: Data.taskModels[taskIndex].todoModels[todoIndex].date) == self?.homeView.dateFormatter.string(from: Date()) {
                        self?.todayTodos.append(Data.taskModels[taskIndex].todoModels[todoIndex])
                    }
                }
            }
            self?.homeView.todayTableView.reloadData()
            self?.homeView.taskCollectionView.reloadData()
        })
    }
    
    @objc func settingsButtonsPressed() {
        let themesVC = ThemesController()
        present(themesVC, animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.placeholder = "Enter Task"
        if textField.text != "" {
            addTask(taskName: textField.text!)
            textField.text = ""
        }
        return false
    }
    
    func addTask(taskName: String){
        TaskFunctions.createTask(taskModel: TaskModel(title: taskName, itemNumbers: 0))
        homeView.taskCollectionView.reloadData()
        let indexPath = IndexPath(row: (Data.taskModels.count - 1), section: 0)
        homeView.taskCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    @objc func itemCompleted(_ button: UIButton){
        let section = button.tag
        button.isSelected = !button.isSelected
        
        let todo = todayTodos[section]
        print("\(todayTodos[section]) is about to get deleted")
 
        if let cell = homeView.todayTableView.headerView(forSection: section) as? TaskHeader {
            UIView.animate(withDuration: 0.6, delay: 0.0, animations: {
                
                cell.titleLabel.attributedText = self.strikeThroughText((todo.title))
                self.updateTaskData(todo, section)
            }, completion: { (success) in
                self.homeView.todayTableView.reloadData()
            })
        }
    }
    
    func updateTaskData(_ todo: TodoModel, _ section: Int) {
        self.homeView.todayTableView.beginUpdates()
        TodoFunctions.deleteTodayTodos(todoModel: todo)
        self.todayTodos.remove(at: section)
        self.homeView.todayTableView.deleteSections([section], with: .right)
        self.homeView.taskCollectionView.reloadData()
        self.homeView.todayTableView.endUpdates()
        if todayTodos.count == 0 {
            homeView.todayTableView.isHidden = true
        }
    }
    
    func strikeThroughText(_ text: String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return todayTodos.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todayTodos.count != 0 {
            homeView.todayTableView.isHidden = false
        }
        return 0
    }
    
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
        let taskVC = TaskController()
        let task = Data.taskModels[indexPath.row]
        taskVC.taskId = task.id
        taskVC.taskIndex = indexPath.row
        self.present(taskVC, animated: true)
    }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.todayTableView.dequeueReusableCell(withIdentifier: homeView.tableViewCellId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = homeView.todayTableView.dequeueReusableHeaderFooterView(withIdentifier: homeView.headerViewId) as! TaskHeader
        let todoModel = todayTodos[section]
        taskHeader.setup(model: todoModel)
        taskHeader.checkBox.tag = section
        return taskHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
}


