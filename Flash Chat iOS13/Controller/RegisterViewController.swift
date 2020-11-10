//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: - Actions
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
//                    print("error auth : \(error.localizedDescription)")
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    self.presentAlert(title: "Error register", message: error.localizedDescription, action: action)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }

        }
    }
    
    // MARK: - Methods
    
    fileprivate func presentAlert(title: String, message: String, action: UIAlertAction) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
}
