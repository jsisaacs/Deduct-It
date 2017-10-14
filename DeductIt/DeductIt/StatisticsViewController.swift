//
//  StatisticsViewController.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/13/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    @IBOutlet weak var totalSpentLabel: UILabel!
    @IBOutlet weak var numberExpensesLoggedLabel: UILabel!
    @IBOutlet weak var mostCommonCategoryLabel: UILabel!
    
    @IBAction func saveSetting(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func backButtonSettingsViewController(_ segue: UIStoryboardSegue) {
    }
    
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
    
    /*
    func totalSpent(expenses:[Expenses]) {
        //add all elements of elements.cost
        //totalSpentLabel = addAll(expenses.cost)
    }
    
    func numberOfExpenses(expenses:[Expense]) {
        //get the number of elements in the array expenses
    }
    
    func mostCommonCategory(expenses:[Expense]) {
        //return whichever expense.category is most common
    }
     */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setLabels()
    }
    
    func setLabels() {
        if (expenses.count == 0) {
            totalSpentLabel.text = "None"
            mostCommonCategoryLabel.text = "No Expenses Logged"
            numberExpensesLoggedLabel.text = "None"
            
            return
        }
        var total : Double = 0
        var categoryLog = [Int](repeating: 0, count:15)
        
        for i in 0 ..< expenses.count {
            total += expenses[i].cost
            let categoryIndex = getCategoryIndex(category:expenses[i].category)
            categoryLog[categoryIndex] += 1
        }
        var mostUsedCategory = 0
        var mostUsedCategoryCount = 0
        
        for i in 0 ..< categoryLog.count {
            if (mostUsedCategoryCount < categoryLog[i]) {
                mostUsedCategoryCount = categoryLog[i]
                mostUsedCategory = i
            }
        }
        totalSpentLabel.text = "$ " + String(total)
        mostCommonCategoryLabel.text = categories[mostUsedCategory]
        numberExpensesLoggedLabel.text = String(expenses.count)
    }
    
    func getCategoryIndex(category:String) -> Int{
        for i in 0 ..< categories.count {
            if (categories[i] == category) {
                return i
            }
        }
        return -1
    }
}

