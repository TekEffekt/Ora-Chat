//
//  MockData.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//  Note: I force unwrap in my test suite. It's not code that my users experience.
//

@testable import OraChat
import Foundation

class MockData {
    
    let user: User
    let users: [User]
    let lastMessage: Message
    let chat: Chat
    let organizedChats: [ChatsOnDay]
    
    init() {
        user = User(id: 1, name: "Alex Patoka", email: "alex@orainteractive.com")
        users = [user]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateString = "2016-12-25T12:00:00+0000"
        let createdDate = dateFormatter.date(from: dateString)!
        lastMessage = Message(id: 1, chatId: 1, userId: 1, text: "What are you doing later today?", createdAt: createdDate, user: user)
        chat = Chat(id: 1, name: "A chat", users: users, lastMessage: lastMessage)
        
        let dan = User(id: 1, name: "Dan", email: "alex@orainteractive.com")
        let anotherDateString = "2017-4-04T12:00:00+0000"
        let anotherCreatedDate = dateFormatter.date(from: anotherDateString)!
        let anotherLastMessage = Message(id: 1, chatId: 1, userId: 1, text: "What's up?", createdAt: anotherCreatedDate, user: dan)
        let anotherChat = Chat(id: 1, name: "A chat 2 by Dan", users: users, lastMessage: anotherLastMessage)
        organizedChats = [ChatsOnDay(chats: [chat], day: "Today"), ChatsOnDay(chats: [anotherChat], day: "July 25")]
    }
    
    func getLastChatMessageDisplayString() -> String {
        let now = Date()
        return "\(lastMessage.user.name) - \(now.displayTime(from: lastMessage.createdAt))"
    }
    
}
