//
//  Parser.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

protocol Parser {
    
    associatedtype Output
    
    func parse(data: Data) -> Output?
    
}
