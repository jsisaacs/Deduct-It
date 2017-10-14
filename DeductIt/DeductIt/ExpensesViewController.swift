//
//  ExpensesViewController.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/12/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import UIKit

class ExpensesViewController: UITableViewController {

    //var expenses = SampleData.generateExpenseData()
}

extension ExpensesViewController {
    
    @IBAction func cancelToExpensesViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveExpenseDetail(_ segue: UIStoryboardSegue) {
        
        guard let expenseDetailsViewController = segue.source as? ExpenseDetailsViewController,
            let expense = expenseDetailsViewController.expense else {
                return
        }
        
        // add the new expense to the expenses array
        expenses.append(expense)
        
        // update the tableView
        let indexPath = IndexPath(row: expenses.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic) 
    }
}

extension ExpensesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count

    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell",
                                                 for: indexPath) as! ExpenseCell
        
        let expense = expenses[indexPath.row]
        cell.expense = expense
        return cell
    }
    
    //to delete expenses from the TableView
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            expenses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
