//
//  ViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func addItemViewController(controller: AddItemViewController, didAdd item: TodoItem) {
        todo.add(item: item)
        if let index = todo.index(of: item) {
            tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) {
         controller.dismiss(animated: true, completion: nil)
    }
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        todo.add(item: TodoItem(title: "Test"))
        todo.add(item: TodoItem(title: "Learning Switf 4"))
        todo.add(item: TodoItem(title: "Hello"))
        todo.add(item: TodoItem(title: "Learning Switf 3",isDone:true))
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAddPage"{
            let navigationController = segue.destination as? UINavigationController
            let controller = navigationController?.topViewController as? AddItemViewController
            
            controller?.delegate = self
        }
    }

}

