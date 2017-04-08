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
        
        if let currentUser = User.loggedInUser {
            nameField.text = currentUser.name
            emailField.text = currentUser.email
        }
    }

}
