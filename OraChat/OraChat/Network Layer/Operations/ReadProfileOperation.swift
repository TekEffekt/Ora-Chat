//
//  ReadProfileOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class ReadProfileOperation: Operation {
    
    typealias Output = User
    let userParser = UserParser()
    
    var request: Request {
        return ReadProfileRequest()
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping ((User) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    if let user = self.userParser.parse(data: data) {
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
