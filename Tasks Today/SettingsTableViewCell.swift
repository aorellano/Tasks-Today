//
//  SettingsTableCell.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/13/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableCell: UITableViewCell {
    func title(_ title: String) {
        titleLabel.text = title
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.current.fontColor
        label.font = UIFont(name: Theme.current.mainFontName, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Theme.current.background
        contentView.backgroundColor = Theme.current.accent
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:0, left: 0, bottom: -14, right: 0))
        
        titleLabelConstraints()
    }
    
    func titleLabelConstraints() {
        contentView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
