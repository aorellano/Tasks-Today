//
//  TextFieldView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/9/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeView: UIView {
    let collectionCellId = "Collection Cell"
    let tableViewCellId = "Table Cell"
    let headerViewId = "sectionheader"
    var taskCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    var tasksLabel = CustomLabel()
    var todayLabel = CustomLabel()
    var textField = CustomTextField()

    var todayTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.layer.cornerRadius = 10.0
        tableView.clipsToBounds = true
        tableView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionViewLayout()
        
        taskCollectionView.register(TaskCollectionCell.self, forCellWithReuseIdentifier: collectionCellId)
        todayTableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        todayTableView.register(TaskHeader.self, forHeaderFooterViewReuseIdentifier: headerViewId)
        
        
        textFieldConstraints()
        tasksLabelConstraints()
        
        collectionViewConstraints()
        todayLabelConstraints()
        tableViewConstraints()
    }
    
    func collectionViewLayout() {
        flowLayout.itemSize = CGSize(width: 145, height: 200)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        taskCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        taskCollectionView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    func textFieldConstraints() {
        self.addSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func tasksLabelConstraints(){
        self.addSubview(tasksLabel)
        tasksLabel.text = "T A S K S"
        tasksLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25).isActive = true
        tasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
    }

    func collectionViewConstraints(){
        self.addSubview(taskCollectionView)
        taskCollectionView.translatesAutoresizingMaskIntoConstraints = false
        taskCollectionView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        taskCollectionView.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor, constant: 25).isActive = true
        taskCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        taskCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    func todayLabelConstraints(){
        self.addSubview(todayLabel)
        todayLabel.text = "T O D A Y"
        todayLabel.topAnchor.constraint(equalTo: taskCollectionView.bottomAnchor, constant: 30).isActive = true
        todayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
    }
    
    func tableViewConstraints(){
        self.addSubview(todayTableView)
        todayTableView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 30).isActive = true
        todayTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        todayTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        todayTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

