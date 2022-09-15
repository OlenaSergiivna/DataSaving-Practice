//
//  ViewController.swift
//  DataSaving Practice
//
//  Created by user on 13.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var shoppingListArray: [String] = [] {

        didSet {
            print("Shopping list array amount is \(shoppingListArray.count) now : \(shoppingListArray)")

        }
    }
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //shoppingListTableView.reloadData()
        
        if let value = UserDefaults.standard.stringArray(forKey: "list") {
            self.shoppingListArray = value
        }
//        print(GlobalVariables.shoppingListArray)
//        print(UserDefaults.standard.stringArray(forKey: "list"))
        
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        showAddingAlert()
       
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAll(from: &shoppingListArray, key: "list") {
            shoppingListTableView.reloadData()
        }
    }
    
    
  
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return UserDefaults.standard.stringArray(forKey: "list")?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        
        if let text = UserDefaults.standard.stringArray(forKey: "list") {
            content.text = text[indexPath.row]
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] _, _, completion in
            
            self?.shoppingListArray.remove(at: indexPath.row)
            UserDefaults.standard.set(self?.shoppingListArray, forKey: "list")
            self?.shoppingListTableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension MainViewController {
    
    func showAddingAlert() {
        
        let dialogMessage = UIAlertController(title: "Alert", message: "Type an item name to add it in the list:", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            
            if let text = dialogMessage.textFields?.first?.text {
                
                if text.count > 2 && (text.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                    self.shoppingListArray.append(text)
                    UserDefaults.standard.set(self.shoppingListArray, forKey: "list")
                
                    
                    self.shoppingListTableView.reloadData()
                }
            }
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        dialogMessage.addAction(addAction)
        dialogMessage.addAction(cancel)
        dialogMessage.addTextField { textField in
            textField.placeholder = "Item name"
        }
        self.present(dialogMessage, animated: true)
        
        
    }

}
