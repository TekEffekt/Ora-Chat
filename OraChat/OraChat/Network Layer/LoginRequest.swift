//
//  UserRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

struct LoginRequest: Request {
    
    let email: String
    let password: String
    
    var endpoint: String {
        return "auth/login"
    }
    
    var method: HttpMethod {
        return .post
    }
    
    var parameters: RequestParameters? {
        return .body(["email": email, "password": password])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
