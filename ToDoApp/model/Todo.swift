//
//  Todo.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import Foundation

class Todo:Codable{
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
    func move(from sourceIndex:Int, to destinationIndex:Int){
        let item = items.remove(at: sourceIndex)
        items.insert(item, at: destinationIndex)
    }
}


