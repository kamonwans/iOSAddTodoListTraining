//
//  AddItemViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate:class {
    func ItemDetailViewController(controller: ItemDetailViewController,didAdd item: TodoItem)
    func ItemDetailViewController(controller: ItemDetailViewController,didEdit item: TodoItem)
    func ItemDetailViewControllerDidCancel(controller: ItemDetailViewController)
}

class ItemDetailViewController: UIViewController {
    
    weak var delegate:ItemDetailViewControllerDelegate?
    var todoItem: TodoItem?
    
    @IBOutlet weak var titleTextField: UITextField?
    @IBOutlet weak var isDoneSwitf: UISwitch?

    @IBAction func cancelButtonDidtap(_ sender: UIBarButtonItem) {
        delegate?.ItemDetailViewControllerDidCancel(controller: self)
    }
    
    @IBAction func doneButtonDidTap(){
      
        
        if let title = titleTextField?.text,
            let isDone = isDoneSwitf?.isOn, !title.isEmpty{
            if let item = todoItem{
                item.title = title
                item.isDone = isDone
                delegate?.ItemDetailViewController(controller: self, didEdit: item)
            }else{
                let item = TodoItem(title: title, isDone: isDone)
                delegate?.ItemDetailViewController(controller: self, didAdd:item)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = todoItem{
            titleTextField?.text = item.title
            isDoneSwitf?.isOn = item.isDone
            
            title = "Edit item"
        }else{
            title = "Add new item"
        }
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextField?.becomeFirstResponder()
    }


}
