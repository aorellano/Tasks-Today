//
//  SettingsView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 7/21/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    var settingsLabel = CustomLabel()
    
    var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Theme.current.background
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsLabelConstraints()
        settingsTableViewConstraints()
        self.backgroundColor = Theme.current.background
        
    }
    
    func settingsLabelConstraints(){
        addSubview(settingsLabel)
        
        settingsLabel.text = "S E T T I N G S"
        settingsLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        settingsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func settingsTableViewConstraints(){
        addSubview(settingsTableView)
        
        settingsTableView.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 20).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


