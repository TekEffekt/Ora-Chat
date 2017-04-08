//
//  DefaultTheme.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

protocol DefaultTheme {
    func applyTheme()
}

extension DefaultTheme where Self: UIViewController {
    
    func applyTheme() {
        styleNavBar()
        view.tintColor = UIColor.appTint()
    }
    
    func styleNavBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.appTint()
    }
    
}
