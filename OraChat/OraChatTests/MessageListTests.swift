//
//  MessageListTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation
import XCTest
@testable import OraChat

class MessageListMock: Dispatcher {
    
    var configuration: NetworkConfiguration
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "message list", ofType: "json") else {
            return
        }
        
        let mockData = NSData(contentsOfFile: path)
        let fakeUrl = URL(fileURLWithPath: path)
        let resp = HTTPURLResponse(url: fakeUrl, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let response = Response(urlResponse: resp, data: mockData as Data?, error: nil, for: request)
        completionHandler(response)
    }
    
}

class MessageListTests: XCTestCase {
    
    let mock = MessageListMock()
    
    func testOperation() {
        let op = ChatMessageListOperation(id: 1, page: 1, limit: 50)
        let expect = expectation(description: "Calls the callback with a native object")
        op.execute(in: mock) { (messages) in
            XCTAssertEqual(messages.count, 4)
            let message = messages.first!
            XCTAssertEqual(message.id, 1)
            XCTAssertEqual(message.chatId, 1)
            XCTAssertEqual(message.userId, 1)
            XCTAssertEqual(message.text, "What are you doing later today?")
            let user = message.user
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "Alex Patoka")
            XCTAssertEqual(user.email, "alex@orainteractive.com")
            expect.fulfill()
        }
        waitForExpectations(timeout: 0.01, handler: nil)
    }
    
}
