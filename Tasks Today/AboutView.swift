//
//  AboutView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 9/3/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIView {
    var aboutText: UITextView = {
        let text = UITextView()
        text.backgroundColor = Theme.current.background
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        aboutTextConstraints()
    }
    
    func aboutTextConstraints() {
        self.addSubview(aboutText)
        
        aboutText.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        aboutText.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        aboutText.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        aboutText.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
