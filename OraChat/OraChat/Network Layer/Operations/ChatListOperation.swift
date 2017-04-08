//
//  ChatOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class ChatListOperation: Operation {
    
    let parser = ChatParser()
    
    typealias Output = [Chat]
    
    var request: Request {
        return ChatListRequest()
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping (([Chat]) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    if let chats = self.parser.parse(data: data) {
                        completionHandler(chats)
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
