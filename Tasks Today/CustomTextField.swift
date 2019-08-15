//
//  CustomTextField.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textFieldLayout()
    }
    
    func textFieldLayout(){
        self.borderStyle = .roundedRect
        self.backgroundColor = Theme.current.accent
        self.layer.masksToBounds = false
        self.textAlignment = .center
        self.attributedPlaceholder = NSAttributedString(string: "Enter Task",attributes: [NSAttributedString.Key.foregroundColor: Theme.current.tint])
        self.textColor = Theme.current.tint
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
