//
//  ChatMessageList.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

struct ChatMessageListRequest: Request {
    
    let id: Int
    let page: Int
    let limit: Int
    
    var method: HttpMethod {
        return .get
    }
    
    var endpoint: String {
        return "chats/\(id)/chat_messages"
    }
    
    var parameters: RequestParameters? {
        return .url(["page": page, "limit": limit])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
