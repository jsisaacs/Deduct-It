//
//  ExpenseDetailsViewController.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/12/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import UIKit

class ExpenseDetailsViewController: UITableViewController {
    
    var expense: Expense?
    
    var category: String = "Category 1" {
        didSet {
            detailLabel.text = category
        }
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("init ExpenseDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit ExpenseDetailsViewController")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveExpenseDetail",
            let expenseName = nameTextField.text,
            let costName = Double(costTextField.text!) {
            expense = Expense(cost: costName, name: expenseName, category: category)
        }
        if segue.identifier == "PickCategory",
            let categoryPickerViewController = segue.destination as? CategoryPickerViewController {
            categoryPickerViewController.selectedCategory = category
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension ExpenseDetailsViewController {
    
    @IBAction func unwindWithSelectedCategory(segue: UIStoryboardSegue) {
        if let categoryPickerViewController = segue.source as? CategoryPickerViewController,
            let selectedCategory = categoryPickerViewController.selectedCategory {
            category = selectedCategory
        }
    }
}

extension ExpenseDetailsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}
