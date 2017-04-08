//
//  AccountViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class AccountViewController: UIViewController, DefaultTheme {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        readCurrentUser()
    }
    
    private func readCurrentUser() {
        let readUserOp = ReadProfileOperation()
        readUserOp.execute { (user) in
            OperationQueue.main.addOperation {
                self.setFields(for: user)
            }
        }
    }
    
    private func setFields(for user: User) {
        nameField.text = user.name
        emailField.text = user.email
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let name = nameField.text else { return }
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let passwordConfirmation = confirmPasswordField.text else { return }
        
        let operation = RegisterOperation(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
        operation.execute { (user) in
            print(user)
        }

    }
}
