//
//  AlertFunction.swift
//  DataSaving Practice
//
//  Created by user on 13.09.2022.
//

import Foundation
import UIKit

func createAlert(viewController: UIViewController, tableView: UITableView) {
    
    let dialogMessage = UIAlertController(title: "Alert", message: "Type an item name to add it in the list:", preferredStyle: .alert)
    
    let add = UIAlertAction(title: "Add", style: .default) { _ in
        
        if let text = dialogMessage.textFields?.first?.text {
            if text.count > 2 && (text.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                GlobalVariables.shoppingListArray.append(text)
                
                UserDefaults.standard.set(GlobalVariables.shoppingListArray, forKey: "list")
                UserDefaults.standard.synchronize()
                tableView.reloadData()
                
            }
        }
    }
    
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    dialogMessage.addAction(add)
    dialogMessage.addAction(cancel)
    dialogMessage.addTextField { textField in
        textField.placeholder = "Item name"
    }
    
    viewController.present(dialogMessage, animated: true, completion: nil)
    
}
