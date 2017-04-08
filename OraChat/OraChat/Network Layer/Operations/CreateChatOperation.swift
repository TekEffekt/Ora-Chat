//
//  CreateChatOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

class CreateChatOperation: Operation {
    
    typealias Output = Chat?
    let chatParser = ChatParser()
    
    let name: String
    let message: String
    
    var request: Request {
        return CreateChatRequest(name: name, message: message)
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping ((Chat?) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
                    completionHandler(nil)
                case .error(let statusCode, let error):
                    print("Status Code: \(statusCode) Error: \(error)")
                }
            }
        } catch {
            print(error)
        }
    }
    
    init(name: String, message: String) {
        self.name = name
        self.message = message
    }
    
}
