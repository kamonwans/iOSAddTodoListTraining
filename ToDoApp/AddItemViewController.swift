//
//  AddItemViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate:class {
    func addItemViewController(controller: AddItemViewController,didAdd item: TodoItem)
    func addItemViewControllerDidCancel(controller: AddItemViewController)
}

class AddItemViewController: UIViewController {
    
    weak var delegate:AddItemViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField?
    @IBOutlet weak var isDoneSwitf: UISwitch?

    @IBAction func cancelButtonDidtap(_ sender: UIBarButtonItem) {
        delegate?.addItemViewControllerDidCancel(controller: self)
    }
    
    @IBAction func doneButtonDidTap(){
        if let title = titleTextField?.text,
            let isDone = isDoneSwitf?.isOn, !title.isEmpty{
            let item = TodoItem(title: title, isDone: isDone)
         delegate?.addItemViewController(controller: self, didAdd:item)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
