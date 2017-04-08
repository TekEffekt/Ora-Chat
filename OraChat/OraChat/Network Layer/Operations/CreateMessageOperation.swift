//
//  CreateMessageOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation

class CreateMessageOperation: Operation {
    
    typealias Output = Message?
    let chatParser = MessageParser()
    
    let id: Int
    let message: String
    
    var request: Request {
        return CreateMessageRequest(id: id, message: message)
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping ((Message?) -> Void)) {
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
    
    init(id: Int, message: String) {
        self.id = id
        self.message = message
    }
    
}

