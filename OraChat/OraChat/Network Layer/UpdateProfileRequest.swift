//
//  UpdateProfileRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

struct UpdateProfileRequest: Request {
    
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
    
    var endpoint: String {
        return "users/current"
    }
    
    var method: HttpMethod {
        return .patch
    }
    
    var parameters: RequestParameters? {
        return .body(["name": name, "email": email, "password": password, "password_confirmation": passwordConfirmation])
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
