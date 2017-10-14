//
//  SettingDetailViewController.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/13/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import UIKit

class SettingDetailViewController: UITableViewController {
    
    @IBOutlet weak var currencyTextField: UITextField!
    
    @IBAction func wipeAllData(_ sender: Any) {
        expenses.removeAll()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
