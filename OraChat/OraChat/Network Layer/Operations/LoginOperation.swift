//
//  LoginOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class LoginOperation: Operation {
    
    let email: String
    let password: String
    let parser = UserParser()
    
    typealias Output = User
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var request: Request {
        return LoginRequest(email: email, password: password)
    }

    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping ((User) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    if let user = self.parser.parse(data: data) {
                        completionHandler(user)
                    }
                case .error(let statusCode, let error):
                    print("Status Code: \(statusCode) Error: \(error)")
                }
            }
        } catch {
            print(error)
        }
    }
    
}
