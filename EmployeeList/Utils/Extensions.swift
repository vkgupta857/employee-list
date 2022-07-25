//
//  Extensions.swift
//  EmployeeList
//
//  Created on 25/07/22.
//  

import UIKit

extension UIViewController {
    func showError(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true) {
            print("Error: \(title) - \(msg)")
        }
    }
}
