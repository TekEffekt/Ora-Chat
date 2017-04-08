//
//  ChatListTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation
import XCTest
@testable import OraChat

class ChatListMock: Dispatcher {
    
    var configuration: NetworkConfiguration
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "chat list", ofType: "json") else {
            return
        }
        
        let mockData = NSData(contentsOfFile: path)
        let fakeUrl = URL(fileURLWithPath: path)
        let resp = HTTPURLResponse(url: fakeUrl, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let response = Response(urlResponse: resp, data: mockData as Data?, error: nil, for: request)
        completionHandler(response)
    }
    
}

class ChatListTests: XCTestCase {
    
    let mock = ChatListMock()
    
    func testOperation() {
        let op = ChatListOperation()
        let expect = expectation(description: "Calls the callback with a native object")
        op.execute(in: mock) { (chats) in
            print(chats)
            let chat = chats.first!
            XCTAssertEqual(chat.id, 1)
            XCTAssertEqual(chat.users.count, 1)
            let user = chat.users.first!
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "Alex Patoka")
            XCTAssertEqual(user.email, "alex@orainteractive.com")
            let message = chat.lastMessage
            XCTAssertEqual(message.id, 1)
            XCTAssertEqual(message.chatId, 1)
            XCTAssertEqual(message.userId, 1)
            XCTAssertEqual(message.text, "What are you doing later today?")
            expect.fulfill()
        }
        waitForExpectations(timeout: 0.01, handler: nil)
    }
    
}
