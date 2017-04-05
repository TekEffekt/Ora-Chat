//
//  ChatTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import XCTest
@testable import OraChat

class ChatTests: XCTestCase {
    
    func testInit() {
        let alex = User(id: 1, name: "Alex Patoka", email: "alex@orainteractive.com")
        let users = [alex]
        let lastMesssage = Message(id: 1, chatId: 1, userId: 1, text: "What are you doing later today?", createdAt: Date(), user: alex)
        let chat = Chat(id: 1, name: "A chat", users: users, lastMessage: lastMesssage)
        XCTAssertEqual(chat.id, 1)
        XCTAssertEqual(chat.name, "A chat")
        XCTAssertEqual(chat.users.first!, alex)
        XCTAssertEqual(chat.lastMessage, lastMesssage)
    }
    
    
    
}
