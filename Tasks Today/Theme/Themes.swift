//
//  Theme.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/23/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class Theme {
    //var dict = [Themes.white: whiteTheme, Themes.black: blackTheme, Themes.blue: blueTheme, Themes.red: redTheme, Themes.green: greenTheme, Themes.purple: purpleTheme, Themes.pink: pinkTheme, Themes.gold: goldTheme]
  
    static var current = whiteTheme
    static var colors = [whiteTheme, blackTheme, blueTheme, redTheme, greenTheme, purpleTheme, pinkTheme, goldTheme]
    static let mainFontName = UIFont(name: "HelveticaNeue-Medium", size: 18)
    static let whiteColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    static let titleColor = UIColor.darkGray
    
    func themeChanged(to theme: UIColor){
        if theme == whiteTheme.background {
            Theme.current = whiteTheme
        } else {
            Theme.current =
        }
    }
}
