//
//  ChatsViewControllerTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import XCTest
@testable import OraChat

class ChatsViewControllerTests: XCTestCase {
    
    var chatsViewController: ChatsViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Chats", bundle: nil)
        chatsViewController = storyboard.instantiateViewController(withIdentifier: "Chats") as! ChatsViewController
        UIApplication.shared.keyWindow!.rootViewController = chatsViewController
        let _ = chatsViewController.view
    }
    
    func testView() {
        XCTAssert(chatsViewController.view != nil)
        XCTAssert(chatsViewController.chatsTableView != nil)
    }
    
    
    
}
