//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: - Actions
    
    @IBAction func loginPressed(_ sender: UIButton) {
        login()
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.delegate = self
    }
    
    // MARK: - Methods
    
    private func login() {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    self.presentAlert(title: "Error login", message: error.localizedDescription, action: action)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
    private func presentAlert(title: String, message: String, action: UIAlertAction) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(action)
        present(ac, animated: true)
    }
}

// MARK: - Keyboard

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login()
        return true
    }
}
