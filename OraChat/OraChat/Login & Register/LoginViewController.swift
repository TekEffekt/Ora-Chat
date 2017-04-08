//
//  LoginViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class LoginViewController: UIViewController, DefaultTheme {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    @IBAction func loginTapped(_ sender: UIBarButtonItem) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        let operation = LoginOperation(email: email, password: password)
        operation.execute { (user) in
            User.loggedInUser = user
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "Show Chats" ,sender: self)
            }
        }
    }
    
    
}
