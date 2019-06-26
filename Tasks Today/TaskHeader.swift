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
    
    func setup(model: TodoModel) {
        titleLabel.text = model.title
        //dateLabel.text = "\(model.date)"
        dateLabel.text = dateFormatter.string(from: model.date)
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
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Create a wireframe"
        label.font = UIFont(name: "Arial", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "12:00"
        label.font = UIFont(name: "Arial", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, h:mm a"
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

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:0, left: 0, bottom: -10, right: 0))
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
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func itemDateConstraints(){
        contentView.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
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
