//
//  TaskModel.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/22/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskModel {
    let id: UUID
    var title: String
    var itemNumbers: Int
    
    init(title: String, itemNumbers: Int){
        id = UUID()
        self.title = title
        self.itemNumbers = itemNumbers
    }
}
