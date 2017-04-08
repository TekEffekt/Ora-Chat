//
//  CreateChatViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import UIKit

class CreateChatTableViewController: UITableViewController, DefaultTheme {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    @IBAction func closeTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createTapped(_ sender: UIBarButtonItem) {
        guard let name = nameField.text else { return }
        guard let message = messageField.text else { return }
        let createChatOp = CreateChatOperation(name: name, message: message)
        createChatOp.execute { (chat) in
            OperationQueue.main.addOperation {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    

}
