//
//  Task.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/21/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

struct TaskModel {
    let id: UUID
    var title: String
    var numberOfItems: Int
    var todoModels = [Todo]()
}
