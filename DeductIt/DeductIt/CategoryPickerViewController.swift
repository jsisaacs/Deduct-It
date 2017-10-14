//
//  CategoryPickerViewController.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/12/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {

    //categories taken from http://www.jamesdance.com/deductions.htm
    
    var categories = [
        "Gifts to Charity",
        "Advertising and Promotion",
        "Dues and Fees",
        "Education and Research",
        "Equipment and Supplies",
        "Home Office",
        "Internet",
        "Job Hunting Expenses",
        "Meals and Entertainment",
        "Telephone Charges",
        "Travel and Transportation",
        "Uniforms and Gear",
        "Gifts up to $25",
        "Casualty and Left Losses",
        "Investment expenses"
    ]
    
    var selectedCategory: String? {
        didSet {
            if let selectedCategory = selectedCategory,
                let index = categories.index(of: selectedCategory) {
                    selectedCategoryIndex = index
            }
        }
    }
    
    var selectedCategoryIndex: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveSelectedCategory",
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        
        let index = indexPath.row
        selectedCategory = categories[index]
    }
}

extension CategoryPickerViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        
        if indexPath.row == selectedCategoryIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension CategoryPickerViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Other row is selected - need to deselect it
        if let index = selectedCategoryIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedCategory = categories[indexPath.row]
        
        // update the checkmark for the current row
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}

