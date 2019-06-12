//
//  TaskDelegate.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskDelegate: NSObject, UITableViewDelegate {
    
    let taskView = TaskView()
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let taskHeader = taskView.taskTableView.dequeueReusableHeaderFooterView(withIdentifier: taskView.headerId)
        taskHeader?.textLabel?.text = "This is the task header"
        //        subjectHeader.expandButton.tag = section
        //        subjectHeader.subjectLabel.text = subjects[section]
        //        subjectHeader.addButton.tag = section
        //        subjectHeader.expandButton.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        //        subjectHeader.addButton.addTarget(self, action: #selector(createItem), for: .touchUpInside)
        
        return taskHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }

    
    
}
