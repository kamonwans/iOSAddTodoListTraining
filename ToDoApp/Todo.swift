//
//  Todo.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import Foundation

class Todo{
    private var items = [TodoItem]()
    
    var totalItems: Int {
        return items.count
    }
    
    func add(item: TodoItem){
        items.insert(item,at:0)
    }
    
    func remove(at index:Int){
        items.remove(at: index)
    }
    
    func item(at index: Int) -> TodoItem{
        return items[index]
    }
    
    func index(of item: TodoItem) -> Int?{
        return items.index(where: { (todoItem)  in
             todoItem === item
        })
        
        
//        return items.index{ (todoItem)  in
//            todoItem === item
//        }
        
//        return items.index{
//            $0 === item
//        }
        
        
    }
}

class TodoItem{
    var title: String
    var isDone:Bool
    init(title:String,isDone:Bool=false) {
        self.title = title
        self.isDone = isDone
    }
    
    func toggleIsDone(){
        isDone = !isDone
    }
}

