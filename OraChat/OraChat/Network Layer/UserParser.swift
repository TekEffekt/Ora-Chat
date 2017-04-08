//
//  LoginParser.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class UserParser: Parser {
    
    typealias Output = User
    
    func parse(data: Data) -> User? {
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return nil
            }
            
            guard let data = json["data"] as? [String: Any] else {
                return nil
            }
            
            return createUser(from: data)
        } catch {
            return nil
        }
    }
    
    func createUser(from json: [String: Any]) -> User? {
        guard let id = json["id"] as? Int, let name = json["name"] as? String, let email = json["email"] as? String else {
            return nil
        }
        
        return User(id: id, name: name, email: email)
    }
    
}
