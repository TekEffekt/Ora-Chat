//
//  CreateChatViewController.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import Foundation
import UIKit

class CustomSearchBar: UISearchBar {
    
    init(){
    super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setShowsCancelButton(_ showsCancelButton: Bool, animated: Bool) {
    }
    
    

}
