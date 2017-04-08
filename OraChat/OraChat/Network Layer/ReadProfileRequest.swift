//
//  ReadProfileRequest.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

struct ReadProfileRequest: Request {
    
    var endpoint: String {
        return "users/current"
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var parameters: RequestParameters? {
        return nil
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "charset": "UTF-8"]
    }
    
}
