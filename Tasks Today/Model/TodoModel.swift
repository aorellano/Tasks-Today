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
    var date = Date()
    var notes: String
    var isChecked: Bool
    var isExpanded: Bool
    
    init(title: String, date: Date, notes: String, isChecked: Bool, isExpanded: Bool){
        id = UUID().uuidString
        self.title = title
        self.date = date
        self.notes = notes
        self.isChecked = isChecked
        self.isExpanded = isExpanded
    }
}
