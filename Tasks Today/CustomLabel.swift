//
//  CustomLabel.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/11/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        labelLayout()
    }
    
    func labelLayout(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: Theme.current.mainFontName, size: 20)
        self.textColor = Theme.current.fontColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
