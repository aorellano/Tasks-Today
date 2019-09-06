//
//  UIButtonExtension.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/26/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func pulse() {
        let pulseAnimation = CASpringAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 0.90
        pulseAnimation.toValue = 1.0
        pulseAnimation.duration = 0.5
        pulseAnimation.initialVelocity = 0.5
        pulseAnimation.damping = 1.0
        
        layer.add(pulseAnimation, forKey: nil)
    }
    
    func editingLayout(){
        self.isHidden = false
        self.backgroundColor = .lightGray
        self.setTitle("Save", for: .normal)
    }
    
    func savedLayout(){
        self.backgroundColor = .blue
        self.setTitle("Saved", for: .normal)
    }
}
