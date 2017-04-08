//
//  NetworkDispatcher.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class NetworkDispatcher: Dispatcher {
    
    var configuration: NetworkConfiguration
    private var session: URLSession
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        let urlRequest = try prepareURLRequest(for: request)
        let task = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            let response = Response(urlResponse: urlResponse as? HTTPURLResponse, data: data, error: error, for: request)
            completionHandler(response)
        }
        task.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        let urlString = "\(configuration.baseUrl)/\(request.endpoint)"
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        
        if let parameters = request.parameters {
            switch parameters {
            case .body(let params):
                if let params = params {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
                } else {
                    throw NetworkErrors.badInput
                }
            case .url(let params):
                if let params = params {
                    let query_params = params.map({ (element) -> URLQueryItem in
                        return URLQueryItem(name: element.key, value: "\(element.value)")
                    })
                    guard var components = URLComponents(string: urlString) else {
                        throw NetworkErrors.badInput
                    }
                    components.queryItems = query_params
                    urlRequest.url = components.url
                } else {
                    throw NetworkErrors.badInput
                }
            }
        }
        
        configuration.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        urlRequest.httpMethod = request.method.rawValue
        
        return urlRequest
    }
}
