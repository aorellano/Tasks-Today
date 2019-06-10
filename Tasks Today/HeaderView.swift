//
//  HeaderViewCollectionReusableView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/10/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var taskLabel: UILabel = {
        let label = UILabel()
        label.text = "T A S K S"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "T O D A Y"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
