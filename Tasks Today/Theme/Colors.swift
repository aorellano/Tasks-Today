//
//  Colors.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/14/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class Colors: ThemeProtocol {
    var mainFontName: String
    var fontColor: UIColor
    var background: UIColor
    var accent: UIColor
    var tint: UIColor
    var circle: String
    
    init(mainFontName: String, fontColor: UIColor, background: UIColor, accent: UIColor, tint: UIColor, circle: String){
        self.mainFontName = mainFontName
        self.fontColor = fontColor
        self.background = background
        self.accent = accent
        self.tint = tint
        self.circle = circle
    }
}

let whiteTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.black, background: UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1), accent: UIColor.white, tint: UIColor.darkGray, circle: "CircleBlack-3")

let blackTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor.black, accent: UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1), tint: UIColor.white, circle: "CircleWhite")

let blueTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background:UIColor(red: 28/255, green: 83/255, blue: 144/255, alpha: 1), accent: UIColor(red: 57/255, green: 97/255, blue: 148/255, alpha: 1), tint: UIColor.white, circle: "CircleWhite")

let redTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor(red: 136/255, green: 28/255, blue: 46/255, alpha: 1.0), accent: UIColor(red: 135/255, green: 54/255, blue: 65/255, alpha: 1.0), tint: UIColor.white, circle: "CircleWhite")

let greenTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor(red: 13/255, green: 100/255, blue: 51/255, alpha: 1.0), accent: UIColor(red: 58/255, green: 110/255, blue: 72/255, alpha: 1.0), tint: UIColor.white, circle: "CircleWhite")

let purpleTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor(red: 65/255, green: 61/255, blue: 141/255, alpha: 1.0), accent: UIColor(red: 79/255, green: 79/255, blue: 144/255, alpha: 1.0), tint: UIColor.white, circle: "CircleWhite")

let pinkTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor(red: 191/255, green: 113/255, blue: 113/255, alpha: 1.0), accent: UIColor(red: 196/255, green: 129/255, blue: 129/255, alpha: 1.0), tint: UIColor.white, circle: "CircleWhite")

let goldTheme = Colors(mainFontName: "HelveticaNeue-Medium", fontColor: UIColor.white, background: UIColor(red: 166/255, green: 144/255, blue: 124/255, alpha: 1.0), accent: UIColor(red: 174/255, green: 156/255, blue: 139/255, alpha: 1.0), tint: UIColor.white, circle: "CircleWhite")

