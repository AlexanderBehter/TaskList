//
//  Extention + UITableViewCell.swift
//  TaskList
//
//  Created by Александр Бехтер on 16.08.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func configure(with taskList: TaskList) {
        let currentTasks = taskList.tasks.filter("isComplete = false")
        let completedTasks = taskList.tasks.filter("isComplete = true")
        
        textLabel?.text = taskList.name
        
        if !currentTasks.isEmpty {
            detailTextLabel?.text = "\(currentTasks.count)"
            accessoryType = .none
        } else if !completedTasks.isEmpty {
            detailTextLabel?.text = nil
            accessoryType = .checkmark
        } else {
            detailTextLabel?.text = "0"
            accessoryType = .none
        }
    }
}
