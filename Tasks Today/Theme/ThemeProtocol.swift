//
//  ThemeProtocol.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/14/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

protocol ThemeProtocol {
    var mainFontName: String { get }
    var fontColor: UIColor { get }
    var background: UIColor { get }
    var accent: UIColor { get }
    var tint: UIColor { get }
    var circle: String { get }
}
