//
//  NetworkConfiguration.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class NetworkConfiguration {
    let baseUrl: NSURL
    var headers: [String: String]
    static var shared: NetworkConfiguration = NetworkConfiguration(urlString: "https://private-93240c-oracodechallenge.apiary-mock.com")
    
    init(urlString: String, headers: [String: String] = [:]) {
        baseUrl = NSURL(string: urlString) ?? NSURL()
        self.headers = headers
    }
}
