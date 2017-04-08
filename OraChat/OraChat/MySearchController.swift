//
//  CreateChatViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import UIKit

class MySearchController: UISearchController, UISearchBarDelegate {
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    lazy var customSearchBar: CustomSearchBar = {
        [unowned self] in
        let result = CustomSearchBar()
        result.delegate = self
        return result
        }()
    
    override var searchBar: UISearchBar {
        get {
            return customSearchBar
        }
    }
    
    init(searchViewController:UIViewController!) {
        super.init(searchResultsController: searchViewController)
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(!searchBar.text!.isEmpty) {
            self.isActive=true
        }
        else {
            self.isActive=false
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    fileprivate override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
