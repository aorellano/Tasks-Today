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
class HomeController: UIViewController, UITextFieldDelegate{
    let homeView = HomeView()
    let collectioCell = TaskCollectionCell()
    
    
    var todayTodos = [TodoModel]() {
        didSet {
            todayTodos = todayTodos.sorted(by: {$0.date < $1.date})
        }
    }
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi")
        loadData()
        print(todayTodos.count)
        
        view.backgroundColor = Theme.current.background
        homeView.textField.delegate = self
        homeView.taskCollectionView.dataSource = self
        homeView.todayTableView.dataSource = self
        homeView.taskCollectionView.delegate = self
        homeView.todayTableView.delegate = self
        
        homeView.settingsIcon.addTarget(self, action: #selector(settingsButtonsPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        view = homeView
    }
    
    @objc func settingsButtonsPressed() {
        print("Trying to go to the settings page")
        let settingsVC = SettingsController()
        
        present(settingsVC, animated: true)
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
            
            
            self?.homeView.todayTableView.reloadData()
            self?.homeView.taskCollectionView.reloadData()
        })
        //        if todayTodos.count == 0{
        //
        //
        //        } else {
        //            homeView.todayTableView.isHidden = false
        //            homeView.finishedLabel.isHidden = true
        //        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.placeholder = "Enter Task"
        
        
        
        if textField.text != "" {
            TaskFunctions.createTask(taskModel: TaskModel(title: textField.text!, itemNumbers: 0))
            homeView.taskCollectionView.reloadData()
            let indexPath = IndexPath(row: (Data.taskModels.count - 1), section: 0)
            homeView.taskCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            textField.text = ""
        }
        return false
    }
    
    @objc func itemCompleted(_ button: UIButton){
        let section = button.tag
        button.isSelected = !button.isSelected
        
        let todo = todayTodos[section]
        print("\(todayTodos[section]) is about to get deleted")
        
        if let cell = homeView.todayTableView.headerView(forSection: section) as? TaskHeader {
            UIView.animate(withDuration: 0.6, delay: 0.0, animations: {
                
                cell.titleLabel.attributedText = self.strikeThroughText((todo.title))
                
                self.homeView.todayTableView.beginUpdates()
                TodoFunctions.deleteTodayTodos(todoModel: todo)
                self.todayTodos.remove(at: section)
                self.homeView.todayTableView.deleteSections([section], with: .right)
                self.homeView.taskCollectionView.reloadData()
                self.homeView.todayTableView.endUpdates()
                
            }, completion: { (success) in
                self.homeView.todayTableView.reloadData()
            })
        }
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
        print("Going to next viewcontroller")
        self.present(taskVC, animated: true)
    }
}
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return todayTodos.count
        //        if let todoModels = todayTodos.count {
        //            return todoModels
        //        } else { return 0 }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todayTodos.count)
        if todayTodos.count != 0 {
            homeView.todayTableView.isHidden = false
        }
        //return todayTodos.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.todayTableView.dequeueReusableCell(withIdentifier: homeView.tableViewCellId, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = homeView.todayTableView.dequeueReusableHeaderFooterView(withIdentifier: homeView.headerViewId) as! TaskHeader
        //        homeView.todayTableView.isHidden = true
        //        homeView.finishedLabel.isHidden = false
        
        let todoModel = todayTodos[section]
        
        
        
        
        taskHeader.setup(model: todoModel)
        
        taskHeader.checkBox.tag = section
        
        
        taskHeader.checkBox.addTarget(self, action: #selector(itemCompleted), for: .touchUpInside)
        
        
        
        
        
        
        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
    
}


