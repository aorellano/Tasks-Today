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
    var sectionItems = [ExpandableItems]()
    var todoItems = [Todo]()
    var todoDates = [NSDate]()
//    var todoItems = [Todo]()
//    var items = [String]()
    func numberOfSections(in tableView: UITableView) -> Int {
//        return subjects.count
        print("number of sections")
        print(todoItems.count)
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionItems[section].isExpanded {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskView.taskTableView.dequeueReusableCell(withIdentifier: taskView.cellId, for: indexPath) as! TaskTableCell
        

        
        let taskDataCell = sectionItems[indexPath.section]
        cell.taskDataCell = taskDataCell
        
        
//        let cellData = todoItems[indexPath.row]
//        
//        cell.cellData = cellData

        //cell.itemLabel.text = sectionItems[indexPath.section].items[indexPath.row]
//        cell.dateLabel.text = dateFormatter.string(from: sectionItems[indexPath.section].dates[indexPath.row] as Date)
//        cell.checkBox.addTarget(self, action: #selector(itemCompleted), for: .touchUpInside)
//        cell.infoButton.addTarget(self, action: #selector(infoButtonPressed), for: .touchUpInside)
//        return cell
        
        return cell
    }
    
}
