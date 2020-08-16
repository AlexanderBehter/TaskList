//
//  StorageManager.swift
//  TaskList
//
//  Created by Александр Бехтер on 16.08.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    let realm = try! Realm()              // запрос к базе
    
    private init() {}
    
    func save(taskList: TaskList) {  // сохранение
        write {
            realm.add(taskList)
        }
    }
    
    func save(task: Task,into taskList: TaskList) {   // coхранить в базу
        write {
            taskList.tasks.append(task)  // записать изменения
        }
    }
    
    func delete(taskList: TaskList) {  // удалить из базы
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func delete(task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func edit(taskList: TaskList, newValue: String) { // изменение
        write {
            taskList.name = newValue
        }
    }
    
    func edit(task: Task, name: String, note: String) {
        write {
            task.name = name
            task.note = note
        }
    }
    
    func done(taskList: TaskList) {
        write {
            taskList.tasks.setValue(true, forKey: "isComplete")
        }
    }
    
    func done(task: Task) {
        write {
            task.isComplete.toggle()
        }
    }
    
    private func write(_ completion:() -> Void) {
        do {
            try realm.write {     //  записать в базу
                completion()
            }
        } catch let error {
        print(error)
        }
    }
}
