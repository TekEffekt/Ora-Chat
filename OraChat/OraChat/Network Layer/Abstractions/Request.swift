//
//  Request.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

protocol Request {
    var endpoint: String { get }
    var method: HttpMethod { get }
    var parameters: RequestParameters? { get }
    var headers: [String: String]? { get }
}
