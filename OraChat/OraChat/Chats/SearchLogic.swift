//
//  SearchModel.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

class SearchLogic {
    
    static func filter(chatsOnDays: [ChatsOnDay], with text: String) -> [ChatsOnDay] {
        var result: [ChatsOnDay] = []
        
        for chats in chatsOnDays {
            for chat in chats.chats {
                if chat.name.lowercased().contains(text.lowercased()) {
                    result.append(chats)
                    break
                }
            }
        }
        return result
    }
    
}
