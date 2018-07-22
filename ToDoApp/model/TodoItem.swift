//
//  TodoItem.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import Foundation

class TodoItem:Codable{
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
