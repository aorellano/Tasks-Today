//
//  TaskTableCell.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskTableCell: UITableViewCell {
    
    var taskDataCell: ExpandableItems! {
        didSet {
            //cell.dateFormatter.string(from: item.time! as Date)
            dateLabel.text = dateFormatter.string(from: taskDataCell.todoDate as Date)
        }
    }
    
    var dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .black
        date.text = "Due: Today at 12:00 PM"
        date.font = UIFont(name: "Arial", size: 12)
        return date
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/dd/yy, h:mm a"
        return formatter
    }()
    
    var notesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Notes:"
        label.font = UIFont(name: "Arial", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var notesView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        dateLabelConstraints()
        notesLabelConstraints()
        notesViewConstraints()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func dateLabelConstraints(){
        contentView.addSubview(dateLabel)
        
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    func notesLabelConstraints(){
        contentView.addSubview(notesLabel)
        notesLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        notesLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
    }
    
    func notesViewConstraints() {
        contentView.addSubview(notesView)
        notesView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 5).isActive = true
        notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 ).isActive = true
        notesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
