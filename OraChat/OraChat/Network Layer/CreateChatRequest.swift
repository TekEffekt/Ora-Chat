//
//  CreateChatRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

struct CreateChatRequest: Request {
    
    let name: String
    let message: String
    
    var endpoint: String {
        return "chats"
    }
    
    var method: HttpMethod {
        return .post
    }
    
    var parameters: RequestParameters? {
        return .body(["name": name, "message": message])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
