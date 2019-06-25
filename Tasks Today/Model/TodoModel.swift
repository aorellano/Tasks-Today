//
//  TodoModel.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/24/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

struct TodoModel {
    var id: String!
    var title: String
    var date: String
    var notes: String
    var isChecked: Bool
    
    init(title: String, date: String, notes: String, isChecked: Bool){
        id = UUID().uuidString
        self.title = title
        self.date = date
        self.notes = notes
        self.isChecked = isChecked
    }
}
