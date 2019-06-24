//
//  TaskHeader.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

//Dont forget to add extensions 

class TaskHeader: UITableViewHeaderFooterView {
    var headerData: Todo! {
        didSet{
            itemLabel.text = headerData.todoName
            itemDate.text = dateFormatter.string(from: headerData.todoDate as Date)
        }
    }
    var expandButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var checkBox: UIButton = {
        let box = UIButton()
        let unchecked = UIImage(named: "Unchecked")
        let checked = UIImage(named: "Checked")
        box.setImage(unchecked, for: .normal)
        box.setImage(checked, for: .selected)
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    var itemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Create a wireframe"
        label.font = UIFont(name: "Arial", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itemDate: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "12:00"
        label.font = UIFont(name: "Arial", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/dd/yy, h:mm a"
        return formatter
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .purple
        contentViewLayout()
        checkBoxConstraints()
        itemLabelConstraints()
        itemDateConstraints()
        expandButtonConstraints()
    }
    
    func contentViewLayout(){
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        contentView.layer.shadowRadius = 1.5
        contentView.layer.shadowOpacity = 0.75
        contentView.layer.masksToBounds = true
    }
    func checkBoxConstraints(){
        addSubview(checkBox)
        checkBox.heightAnchor.constraint(equalToConstant: 22).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 22).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func itemLabelConstraints(){
        contentView.addSubview(itemLabel)
        itemLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10).isActive = true
        itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func itemDateConstraints(){
        contentView.addSubview(itemDate)
        itemDate.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor).isActive = true
        itemDate.topAnchor.constraint(equalTo: itemLabel.bottomAnchor).isActive = true
    }
    
    func expandButtonConstraints(){
        contentView.addSubview(expandButton)
        expandButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        expandButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        expandButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        expandButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
