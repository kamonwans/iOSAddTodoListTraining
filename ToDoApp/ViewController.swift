//
//  ViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var todo = Todo()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.totalItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = todo.item(at: indexPath.row).title
        cell.accessoryType = todo.item(at: indexPath.row).isDone ? .checkmark: .none
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todo.add(item: TodoItem(title: "Test"))
        todo.add(item: TodoItem(title: "Learning Switf 3"))
        todo.add(item: TodoItem(title: "Hello"))
        todo.add(item: TodoItem(title: "Learning Switf 3",isDone:true))
        
    }


}

