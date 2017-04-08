//
//  LastMessageParser.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class MessageParser: Parser {
    
    typealias Output = [Message]
    let userParser = UserParser()
    
    func parse(data: Data) -> [Message]? {
        var messages: [Message] = []
        
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
            guard let data = json["data"] as? [[String: Any]] else { return nil }
            
            for messageJson in data {
                guard let message = createMessage(from: messageJson) else { continue }
                messages.append(message)
            }
            
            return messages
        } catch {
            return nil
        }
    }
    
    func createMessage(from json: [String: Any]) -> Message? {
        
        guard let id = json["id"] as? Int, let chatId = json["chat_id"] as? Int,
            let userId = json["user_id"] as? Int, let text = json["message"] as? String,
        let createdAtString = json["created_at"] as? String else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let createdAt = dateFormatter.date(from: createdAtString) else { return nil }
        guard let userJson = json["user"] as? [String: Any] else { return nil }
        guard let user = userParser.createUser(from: userJson) else { return nil }
        let message = Message(id: id, chatId: chatId, userId: userId, text: text, createdAt: createdAt, user: user)
        return message
    }
}
