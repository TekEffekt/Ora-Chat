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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatsDatasource = ChatsDatasource(tableView: chatsTableView)
        chatsTableView.dataSource = chatsDatasource
        applyTheme()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIndexPath = indexPath
        performSegue(withIdentifier: "Show Chat Detail", sender: self)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? ChatDetailViewController {
            detail.chat = chatsDatasource.getChat(for: chosenIndexPath!)
        }
    }
    
}
