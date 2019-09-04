//
//  AboutController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 9/3/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class AboutController: UIViewController {
    let aboutView = AboutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func loadView() {
        view = aboutView
    }
}
