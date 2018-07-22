//
//  TodoItemTableViewCell.swift
//  ToDoApp
//
//  Created by liuyao on 22/7/2561 BE.
//  Copyright © 2561 liuyao. All rights reserved.
//

import UIKit

protocol TodoItemTableCellDelegate:class {

func todoItemTableViewCellCheckBoxButtonDidTap(cell:TodoItemTableViewCell)
    
}

class TodoItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    weak var delegate: TodoItemTableCellDelegate?
    @IBAction func checkBoxButtonDidTap(){
        delegate?.todoItemTableViewCellCheckBoxButtonDidTap(cell: self)
    }
}
