//
//  ViewController.swift
//  DataSaving Practice
//
//  Created by user on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shoppingListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var dialogMessage = UIAlertController(title: "Alert", message: "Type an item name to add it in the list:", preferredStyle: .alert)
        let add = UIAlertAction(title: "Add", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        dialogMessage.addAction(add)
        dialogMessage.addAction(cancel)
        dialogMessage.addTextField { textField in
            textField.placeholder = "Item name"
        }
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}

