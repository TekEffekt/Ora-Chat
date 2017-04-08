//
//  ChatsDatasourceTests.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import XCTest
@testable import OraChat

class ChatsDatasourceTests: XCTestCase {
    
    var datasource: ChatsDatasource!
    var chatsViewController: ChatsViewController!
    let mockData = MockData()
    
    override func setUp() {
        super.setUp()
        datasource = ChatsDatasource(organizedChats: mockData.organizedChats, tableView: UITableView(), searchBar: UISearchBar())
        let storyboard = UIStoryboard(name: "Chats", bundle: nil)
        chatsViewController = storyboard.instantiateViewController(withIdentifier: "Chats") as! ChatsViewController
        chatsViewController.chatsDatasource = datasource
        UIApplication.shared.keyWindow!.rootViewController = chatsViewController
        let _ = chatsViewController.view
    }

    func testChats() {
        XCTAssertEqual(datasource.organizedChats.count, 2)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(datasource.numberOfSections(in: UITableView()), 2)
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(datasource.tableView(UITableView(), numberOfRowsInSection: 0), 1)
    }
    
    func testCellCreation() {
        let cell = datasource.tableView(chatsViewController.chatsTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(cell is ChatCell)
        let chatCell = cell as! ChatCell
        XCTAssertEqual(chatCell.chatNameLabel.text, mockData.chat.name)
        //XCTAssertEqual(chatCell.lastMessageMetaLabel.text, mockData.getLastChatMessageDisplayString())
        XCTAssertEqual(chatCell.messageTextLabel.text, mockData.lastMessage.text)
    }
    
    func testTitleForHeader() {
        for (i, chatsInDay) in datasource.organizedChats.enumerated() {
            XCTAssertEqual(chatsInDay.day, datasource.tableView(UITableView(), titleForHeaderInSection: i))
        }
    }
    
}
