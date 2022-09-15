//
//  File.swift
//  DataSaving Practice
//
//  Created by user on 15.09.2022.
//

import Foundation
import UIKit

func deleteAll(from array: inout [String], key: String, completion: () -> Void) {
    
    array.removeAll()
    UserDefaults.standard.set(array, forKey: key)
    completion()
    
}
