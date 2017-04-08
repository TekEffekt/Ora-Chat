//
//  ChatMessageListOperation.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class ChatMessageListOperation: Operation {
    
    typealias Output = [Message]
    let messageParser = MessageParser()
    
    let id: Int
    let page: Int
    let limit: Int
    
    var request: Request {
        return ChatMessageListRequest(id: id, page: page, limit: limit)
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping (([Message]) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    if let messages = self.messageParser.parse(data: data) {
                        completionHandler(messages)
                    }
                case .error(let statusCode, let error):
                    print("Status Code: \(statusCode) Error: \(error)")
                }
            }
        } catch {
            print(error)
        }
    }
    
    init(id: Int, page: Int, limit: Int) {
        self.id = id
        self.page = page
        self.limit = limit
    }
    
}
