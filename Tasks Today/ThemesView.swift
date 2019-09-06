//
//  ThemesView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class ThemesView: UIView {
    var themesLabel = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Theme.current.background
        
        themesLabelConstraints()
        colorTableViewConstraints()
        
    }
    
    var colorTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.layer.cornerRadius = 10.0
        tableView.clipsToBounds = true
        tableView.backgroundColor = Theme.current.background
        tableView.separatorColor = .clear
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func themesLabelConstraints(){
        addSubview(themesLabel)
        
        themesLabel.text = "T H E M E S"
        themesLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        themesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func colorTableViewConstraints(){
        self.addSubview(colorTableView)
        colorTableView.topAnchor.constraint(equalTo: themesLabel.bottomAnchor, constant: 20).isActive = true
        colorTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        colorTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
        colorTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
