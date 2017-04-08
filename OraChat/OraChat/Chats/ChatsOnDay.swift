//
//  ChatsOnDay.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import Foundation

struct ChatsOnDay {
    let chats: [Chat]
    let day: String
    
    // TEMP
    static func organize(chats: [Chat]) -> [ChatsOnDay] {
        let day = ChatsOnDay(chats: chats, day: "December 25")
        return [day]
    }
}
