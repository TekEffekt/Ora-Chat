//
//  ChatParser.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class ChatParser: Parser {
    
    typealias Output = [Chat]
    let userParser = UserParser()
    let messageParser = MessageParser()
    
    func parse(data: Data) -> [Chat]? {
        do {
            var chats: [Chat] = []
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
            
            guard let data = json["data"] as? [[String: Any]] else { return nil }
            
            for chat in data {
                var users: [User] = []
                guard let id = chat["id"] as? Int, let name = chat["name"] as? String else { continue }
                
                guard let usersJson = chat["users"] as? [[String: Any]] else { continue }
                for userJson in usersJson {
                    guard let user = userParser.createUser(from: userJson) else { continue }
                    users.append(user)
                }
                
                guard let lastMessageJson = chat["last_chat_message"] as? [String: Any] else { continue }
                guard let lastMessage = messageParser.createMessage(from: lastMessageJson) else { continue }
                let chat = Chat(id: id, name: name, users: users, lastMessage: lastMessage)
                chats.append(chat)
            }
            
            return chats
        } catch {
            return nil
        }
    }
    
}
