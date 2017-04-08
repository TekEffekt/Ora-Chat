//
//  Response.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

enum Response {
    case json(_: Data)
    case error(_: Int?, _: Error?)
    
    init(urlResponse: HTTPURLResponse?, data: Data?, error: Error?, for request: Request) {
        guard let urlResp = urlResponse else {
            self = .error(nil, error)
            return
        }
        
        guard urlResp.statusCode >= 200 && urlResp.statusCode < 300, error == nil else {
            self = .error(urlResponse?.statusCode, error)
            return
        }
        
        guard let data = data else {
            self = .error(urlResponse?.statusCode, NetworkErrors.noData)
            return
        }
        
        self = .json(data)
    }
}
