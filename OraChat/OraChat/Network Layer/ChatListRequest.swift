//
//  ChatsRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

struct ChatListRequest: Request {
    
    var endpoint: String {
        return "chats"
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var parameters: RequestParameters? {
        return .url(["page": 1, "limit": 50])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
