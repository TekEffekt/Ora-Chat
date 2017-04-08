//
//  ChatsDetailViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class ChatDetailViewController: UIViewController, DefaultTheme {

    var chat: Chat!
    @IBOutlet weak var chatViewContainer: UIView!
    var chatView: ChatView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        chatView = ChatView(frame: chatViewContainer.bounds, messages: [])
        chatViewContainer.addSubview(chatView)
        navigationItem.title = chat.name
        downloadMessages()
    }
    
    private func downloadMessages() {
        let messageListOp = ChatMessageListOperation(id: chat.id, page: 1, limit: 50)
        messageListOp.execute { (messages) in
            OperationQueue.main.addOperation {
                self.chatView.messages = messages
                self.chatView.setNeedsDisplay()
            }
        }
    }

    @IBAction func tappedPlus(_ sender: UIButton) {
        performSegue(withIdentifier: "Show Create Message", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController {
            if let createMessageVc = nav.visibleViewController as? CreateMessageTableViewController {
                createMessageVc.chatId = chat.id
            }
        }
    }
    
}
