//
//  UITextFieldExtension.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/24/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    var hasValue: Bool {
        guard text == "" else { return true }
        
        self.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 160/255, alpha: 1)
        self.placeholder = "Invalid entry"
        return false
    }
}
