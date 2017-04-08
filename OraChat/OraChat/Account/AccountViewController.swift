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

}
