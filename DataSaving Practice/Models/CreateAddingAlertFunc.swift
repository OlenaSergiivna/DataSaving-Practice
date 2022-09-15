//
//  AlertFunction.swift
//  DataSaving Practice
//
//  Created by user on 13.09.2022.
//

import Foundation
import UIKit

func showAddingAlert(tableView: UITableView, completion: (UIAlertController) -> Void) {
    
    let dialogMessage = UIAlertController(title: "Alert", message: "Type an item name to add it in the list:", preferredStyle: .alert)
    
    let addAction = UIAlertAction(title: "Add", style: .default) { _ in
        
        if let text = dialogMessage.textFields?.first?.text {
            
            if text.count > 2 && (text.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                addItem(name: text)
                
                GlobalVariables.shoppingListArray.append(text)
                UserDefaults.standard.set(GlobalVariables.shoppingListArray, forKey: "list")
                
                
            }
        }
    }
    
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    dialogMessage.addAction(addAction)
    dialogMessage.addAction(cancel)
    dialogMessage.addTextField { textField in
        textField.placeholder = "Item name"
    }
    completion(dialogMessage)
    
    
}
