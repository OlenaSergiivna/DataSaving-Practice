//
//  File.swift
//  DataSaving Practice
//
//  Created by user on 15.09.2022.
//

import Foundation
import UIKit

func deleteAll(comletion: () -> Void) {
    
    UserDefaults.standard.removeObject(forKey: "list")
    UserDefaults.standard.synchronize()
    comletion()
    
}
