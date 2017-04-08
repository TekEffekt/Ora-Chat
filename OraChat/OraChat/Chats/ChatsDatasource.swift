//
//  ChatsDatasource.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import Foundation
import UIKit

class ChatsDatasource: NSObject, UITableViewDataSource {
    
    private var organizedChats: [ChatsOnDay]
    let tableView: UITableView
    
    init(organizedChats: [ChatsOnDay] = [], tableView: UITableView) {
        self.organizedChats = organizedChats
        self.tableView = tableView
        super.init()
        downloadChats()
    }
    
    private func downloadChats() {
        let chatListOp = ChatListOperation()
        chatListOp.execute { (chats) in
            self.organizedChats = ChatsOnDay.organize(chats: chats)
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return organizedChats.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chatsOnDay = organizedChats[section]
        return chatsOnDay.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatCell = tableView.dequeueReusableCell(withIdentifier: "Chat Cell") as? ChatCell else { return UITableViewCell() }
        let chat = organizedChats[indexPath.section].chats[indexPath.row]
        chatCell.chatNameLabel.text = chat.name
        chatCell.lastMessageMetaLabel.text = chat.lastMessage.getMetaData()
        chatCell.messageTextLabel.text = chat.lastMessage.text
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return organizedChats[section].day
    }
    
    func getChat(for indexPath: IndexPath) -> Chat {
        return organizedChats[indexPath.section].chats[indexPath.row]
    }
    
}
