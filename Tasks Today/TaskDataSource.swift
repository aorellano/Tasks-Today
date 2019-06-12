//
//  TaskDataSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskDataSource: NSObject, UITableViewDataSource {
    let taskView = TaskView()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskView.taskTableView.dequeueReusableCell(withIdentifier: taskView.cellId, for: indexPath) as! TaskTableCell
        return cell
    }
}
