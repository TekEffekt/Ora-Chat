//
//  CreateMessageTableViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import UIKit

class CreateMessageTableViewController: UITableViewController, DefaultTheme {

    @IBOutlet weak var messageField: UITextField!
    var chatId: Int!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    @IBAction func closeTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createTapped(_ sender: UIBarButtonItem) {
        guard let message = messageField.text else { return }
        let createMessageOp = CreateMessageOperation(id: chatId, message: message)
        createMessageOp.execute { (message) in
            OperationQueue.main.addOperation {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    

}
