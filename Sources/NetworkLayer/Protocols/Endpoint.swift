//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation

public protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

public extension Endpoint {
    var headers: [String: String]? {
        nil
    }
    
    var parameters: [String: Any]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    private var urlComponents: URLComponents {
        guard var components = URLComponents(string: base) else {
            return URLComponents()
        }
        components.path = path
        if let queryItems, !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        return components
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        return request
    }
}
