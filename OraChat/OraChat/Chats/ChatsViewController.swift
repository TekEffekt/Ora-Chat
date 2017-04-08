//
//  ChatsViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import UIKit

class ChatsViewController: UIViewController, UITableViewDelegate, DefaultTheme {

    @IBOutlet weak var chatsTableView: UITableView!
    var chatsDatasource: ChatsDatasource!
    var chosenIndexPath: IndexPath?
    var searchController = MySearchController(searchViewController: nil)
    var cancelButton: UIButton?
    var cancel: UIBarButtonItem?
    var searchButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatsDatasource = ChatsDatasource(tableView: chatsTableView, searchBar: searchController.searchBar)
        chatsTableView.dataSource = chatsDatasource
        searchController.searchResultsUpdater = chatsDatasource
        applyTheme()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIndexPath = indexPath
        performSegue(withIdentifier: "Show Chat Detail", sender: self)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Show Create Chat", sender: self)
    }
    
    @IBAction func searchTapped(_ sender: UIBarButtonItem) {
        clearNavBarForSearchAction()
    }
    
    func styleSearch() {
        let searchBar = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
    }
    
    func clearNavBarForSearchAction() {
        styleSearch()
        searchButton = navigationItem.rightBarButtonItem
        navigationItem.leftBarButtonItems = []
        navigationItem.hidesBackButton = true
        let cancel = UIBarButtonItem(title: "Close", style: .plain, target: self, action:  #selector(self.clearSearch))
        navigationItem.rightBarButtonItems = [cancel]
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.becomeFirstResponder()
    }
    
    func clearSearch() {
        navigationItem.titleView = nil
        navigationItem.title = "OraChat"
        navigationItem.rightBarButtonItem = searchButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? ChatDetailViewController {
            detail.chat = chatsDatasource.getChat(for: chosenIndexPath!)
        }
    }
    
}
