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

    @IBAction func authentificationButtonTapped(_ sender: UIButton) {
        authentificationUser()
    }
    
    // MARK: - Properties
    var identifierSegue = String()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identifierSegue = K.registerSegue
        passwordTextfield.delegate = self
        emailTextfield.delegate = self
    }
    
    // MARK: - Methods
    
    func authentificationUser() {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                self.authResult(error)
            }
        }
    }
    
    func authResult(_ error: Error?) {
        if let error = error {
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            presentAlert(title: "Error register", message: error.localizedDescription, action: action)
        } else {
            self.performSegue(withIdentifier: self.identifierSegue, sender: self)
        }
    }
}

// MARK: - Keyboard

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authentificationUser()
        return true
    }
}
