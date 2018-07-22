//
//  ViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ItemDetailViewControllerDelegate, TodoItemTableCellDelegate{
    func todoItemTableViewCellCheckBoxButtonDidTap(cell: TodoItemTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
            todo.item(at: indexPath.row).toggleIsDone()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    var todo = Todo()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: ItemDetail Delegate
    func ItemDetailViewController(controller: ItemDetailViewController, didAdd item: TodoItem) {
        todo.add(item: item)
        if let index = todo.index(of: item) {
            tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func ItemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
         controller.dismiss(animated: true, completion: nil)
    }
    
    func ItemDetailViewController(controller: ItemDetailViewController, didEdit item: TodoItem) {
        if let index = todo.index(of: item) {
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
        controller.dismiss(animated: true, completion: nil)
        
    }


    //MARK: tableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.totalItems
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath) as! TodoItemTableViewCell
        let item = todo.item(at: indexPath.row)
        cell.delegate = self
        cell.titleLabel.text = item.title
        cell.checkBoxButton.setImage(UIImage(named: item.isDone ? "check": "uncheck"), for: .normal)
       
        return cell
    }
    
    //MARK: TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "openEditPage", sender: todo.item(at: indexPath.row))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todo.add(item: TodoItem(title: "Test"))
        todo.add(item: TodoItem(title: "Learning Switf 4"))
        todo.add(item: TodoItem(title: "Hello"))
        todo.add(item: TodoItem(title: "Learning Switf 3",isDone:true))
        
    }

    //MARK: Navigation segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAddPage"{
            let navigationController = segue.destination as? UINavigationController
            let controller = navigationController?.topViewController as? ItemDetailViewController
            
            controller?.delegate = self
        }else if segue.identifier == "openEditPage"{
            let navigationController = segue.destination as? UINavigationController
            let controller = navigationController?.topViewController as? ItemDetailViewController
            controller?.delegate = self
            controller?.todoItem = sender as? TodoItem
        }
        
    }

}

