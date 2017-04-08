//
//  UpdateProfileOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

class UpdateProfileOperation: Operation {
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
    let parser = UserParser()
    
    typealias Output = User
    
    init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
    
    var request: Request {
        return UpdateProfileRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
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
