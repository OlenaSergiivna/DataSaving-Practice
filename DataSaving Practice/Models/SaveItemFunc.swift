//
//  SaveItemFunc.swift
//  DataSaving Practice
//
//  Created by user on 15.09.2022.
//

import Foundation

func saveItem(value: [String], forKey key: String) {
    
    UserDefaults.standard.set(value, forKey: key)
}
