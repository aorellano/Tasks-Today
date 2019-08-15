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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Theme.current.background
        
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
    
    func colorTableViewConstraints(){
        self.addSubview(colorTableView)
        colorTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        colorTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        colorTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
        colorTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
