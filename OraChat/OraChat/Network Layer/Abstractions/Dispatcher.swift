//
//  Dispatcher.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

protocol Dispatcher {
    
    var configuration: NetworkConfiguration { get }
    
    init(configuration: NetworkConfiguration)
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws
    
}
