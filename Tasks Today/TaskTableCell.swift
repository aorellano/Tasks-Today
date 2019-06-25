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
    
        var notesLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = "Notes:"
            label.font = UIFont(name: "Arial", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        var notesView: UITextView = {
            let view = UITextView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        var saveButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.setTitle("Done", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = Theme.mainFontName?.withSize(14)
            button.layer.cornerRadius = 5.0
            button.layer.masksToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 10
            
            notesLabelConstraints()
            notesViewConstraints()
            saveButtonConstraints()
        }
        override func layoutSubviews() {
            super.layoutSubviews()
            
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 5, right: 0))
        }
    
        func setup(model: TodoModel) {
            notesView.text = model.notes
        }
        func notesLabelConstraints(){
            contentView.addSubview(notesLabel)
            notesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            notesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        }
        
        func notesViewConstraints() {
            contentView.addSubview(notesView)
            notesView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 5).isActive = true
            notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
            notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 ).isActive = true
            notesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        }
        
        func saveButtonConstraints(){
            contentView.addSubview(saveButton)
            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
