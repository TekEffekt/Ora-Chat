//
//  User.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

struct User {
    let id: Int
    let name: String
    let email: String
}

extension User: Equatable {
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.email == rhs.email
    }
    
}
