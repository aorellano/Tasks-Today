//
//  TaskDataSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class TaskDataSource: NSObject, UITableViewDataSource, UITextViewDelegate {
    let taskView = TaskView()
    var sectionItems = [ExpandableItems]()
    var todoItems = [Todo]()
    var todoDates = [NSDate]()
    var text: String!
    
    func numberOfSections(in tableView: UITableView) -> Int {
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
        
        cell.notesView.delegate = self
        cell.saveButton.addTarget(self, action: #selector(addingNotes), for: .touchUpInside)
        
        return cell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("First")
        print(textView.text!)
        text = textView.text!
    }
    @objc func addingNotes(_ button: UIButton){
        print("Attempting to add notes")
        
        let section = button.tag
        print(text ?? "nil")
        sectionItems[section].notes = "\(text ?? "")"
        print(sectionItems[section])
    }
}
