//
//  AddItemViewController.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBAction func cancelButtonDidtap(_ sender: UIBarButtonItem) {
        print("cancel")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonDidTap(){
        print("done")
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
