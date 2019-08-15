//
//  TaskCollectionCell.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskCollectionCell: UICollectionViewCell {
    
    func setup(taskModel: TaskModel){
        taskName.text = taskModel.title
        numberLabel.text = "\(taskModel.todoModels.count)"
    }
    
    var taskName: UILabel = {
        let label = UILabel()
        label.text = "Task"
        label.font = UIFont(name: Theme.current.mainFontName, size: 18)
        label.textColor = Theme.current.fontColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var circleImage: UIImageView = {
        let circle = UIImageView()
        circle.image = UIImage(named: Theme.current.circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont(name: Theme.current.mainFontName, size: 30)
        label.textColor = Theme.current.fontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Items"
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.textColor = Theme.current.fontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor =  Theme.current.accent
        
        taskNameConstraints()
        circleImageConstraints()
        numberLabelConstraints()
        itemsLabelConstraints()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 8
    }
    
    func taskNameConstraints(){
        self.addSubview(taskName)
        taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        taskName.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        taskName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func circleImageConstraints() {
        self.addSubview(circleImage)
        circleImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 25).isActive = true
        
        circleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        circleImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    func numberLabelConstraints(){
        self.addSubview(numberLabel)
        numberLabel.centerXAnchor.constraint(equalTo: circleImage.centerXAnchor).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor, constant: -10).isActive = true
    }
    
    func itemsLabelConstraints(){
        self.addSubview(itemsLabel)
        itemsLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor).isActive = true
        itemsLabel.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

