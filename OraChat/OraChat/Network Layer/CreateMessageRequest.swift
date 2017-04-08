//
//  CreateMessageRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

struct CreateMessageRequest: Request {
    
    let id: Int
    let message: String
    
    var endpoint: String {
        return "chats/\(id)/chat_messages"
    }
    
    var method: HttpMethod {
        return .post
    }
    
    var parameters: RequestParameters? {
        return .body(["message": message])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
