//
//  LoginTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import XCTest
@testable import OraChat

class LoginMock: Dispatcher {
    
    var configuration: NetworkConfiguration
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "login", ofType: "json") else {
            return
        }
        
        let mockData = NSData(contentsOfFile: path)
        let resp = HTTPURLResponse(url: URL(string: path)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let response = Response(urlResponse: resp, data: mockData as Data?, error: nil, for: request)
        completionHandler(response)
    }
    
}

class LoginTests: XCTestCase {
    
    let mock = LoginMock()
    
    func testOperation() {
        let op = LoginOperation(email: "", password: "")
        let expect = expectation(description: "calls the callback with a resource object")
        op.execute(in: mock) { (user) in
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "Alex Patoka")
            XCTAssertEqual(user.email, "alex@orainteractive.com")
            expect.fulfill()
        }
        waitForExpectations(timeout: 0.01, handler: nil)
    }
    
}
