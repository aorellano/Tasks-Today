//
//  CollectionCellView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class CollectionCellView: UICollectionViewCell {
    
    var taskName: UILabel = {
        let label = UILabel()
        label.text = "Task"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var circleImage: UIImageView = {
        let circle = UIImageView()
        circle.image = UIImage(named: "CircleBlack-3")
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Items"
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        taskNameConstraints()
        circleImageConstraints()
        numberLabelConstraints()
        itemsLabelConstraints()
    }
    
    func taskNameConstraints(){
        self.addSubview(taskName)
        taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        taskName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func circleImageConstraints() {
        self.addSubview(circleImage)
        circleImage.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 20).isActive = true
        circleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
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
