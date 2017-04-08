//
//  ChatsDatasource.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import Foundation
import UIKit

class ChatsDatasource: NSObject, UITableViewDataSource, UISearchResultsUpdating {
    
    var organizedChats: [ChatsOnDay]
    private var filteredChats: [ChatsOnDay] = []
    let tableView: UITableView
    let searchBar: UISearchBar
    
    init(organizedChats: [ChatsOnDay] = [], tableView: UITableView, searchBar: UISearchBar) {
        self.organizedChats = organizedChats
        self.tableView = tableView
        self.searchBar = searchBar
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
        return getOrganizedChats().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chatsOnDay = getOrganizedChats()[section]
        return chatsOnDay.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatCell = tableView.dequeueReusableCell(withIdentifier: "Chat Cell") as? ChatCell else { return UITableViewCell() }
        let chat = getOrganizedChats()[indexPath.section].chats[indexPath.row]
        chatCell.chatNameLabel.text = chat.name
        chatCell.lastMessageMetaLabel.text = chat.lastMessage.getMetaData()
        chatCell.messageTextLabel.text = chat.lastMessage.text
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getOrganizedChats()[section].day
    }
    
    func getChat(for indexPath: IndexPath) -> Chat {
        return getOrganizedChats()[indexPath.section].chats[indexPath.row]
    }
    
    private func getOrganizedChats() -> [ChatsOnDay] {
        if searchBar.isFirstResponder {
            return filteredChats
        } else {
            return organizedChats
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        let strippedText = searchText!.trimmingCharacters(in: CharacterSet.whitespaces)
        filteredChats = SearchLogic.filter(chatsOnDays: organizedChats, with: strippedText)
        tableView.reloadData()
    }
    
}
