//
//  RegisterViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    
    @IBAction func submitTapped(_ sender: UIBarButtonItem) {
        guard let name = nameField.text else { return }
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let passwordConfirmation = confirmPasswordField.text else { return }
        
        let operation = RegisterOperation(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
        operation.execute { (user) in
            print(user)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "Show Chats" ,sender: self)
            }
        }
    }

}
