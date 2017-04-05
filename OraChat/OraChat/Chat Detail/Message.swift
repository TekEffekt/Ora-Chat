//
//  Message.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import Foundation

struct Message {
    let id: Int
    let chatId: Int
    let userId: Int
    let text: String
    let createdAt: Date
    let user: User
}

extension Message: Equatable {
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id && lhs.chatId == rhs.chatId && lhs.userId == rhs.userId && lhs.text == rhs.text && lhs.createdAt == rhs.createdAt && lhs.user == rhs.user
    }
    
}
