//
//  Task.swift
//  TaskList
//
//  Created by Александр Бехтер on 16.08.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//


import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}

class TaskList: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    var tasks = List<Task>()
}
