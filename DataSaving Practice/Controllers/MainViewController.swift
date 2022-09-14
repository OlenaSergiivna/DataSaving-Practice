//
//  ViewController.swift
//  DataSaving Practice
//
//  Created by user on 13.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListTableView.reloadData()
        
        if let value = UserDefaults.standard.stringArray(forKey: "list") {
            GlobalVariables.shoppingListArray = value
        }
//        UserDefaults.standard.removeObject(forKey: "list")
//        UserDefaults.standard.synchronize()
        print(GlobalVariables.shoppingListArray)
        print(UserDefaults.standard.stringArray(forKey: "list"))
        
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        createAlert(viewController: self, tableView: shoppingListTableView)
        print(GlobalVariables.shoppingListArray.count)
       
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
            print(GlobalVariables.shoppingListArray)
            
            GlobalVariables.shoppingListArray.remove(at: indexPath.row)
            UserDefaults.standard.set(GlobalVariables.shoppingListArray, forKey: "list")
            self?.shoppingListTableView.deleteRows(at: [indexPath], with: .fade)
   
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
