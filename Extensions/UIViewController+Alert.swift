//
//  UIViewController+Alert.swift
//  Flash Chat iOS13
//
//  Created by Angelique Babin on 17/11/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

// MARK: - Extension to display an alert message to the user

extension UIViewController {

    func presentAlert(title: String, message: String, action: UIAlertAction) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(action)
        present(ac, animated: true)
    }
}
