//
//  NSAttributedString.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 9/6/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func strikeThroughText(_ text: String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
