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
    var queryItems: [String: String]? { get }
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
    
    var queryItems: [String: String]? {
        nil
    }
    
    var requestStringURL: String {
        base + path
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let baseURL = URL(string: requestStringURL) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        if let queryParams = queryItems {
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
            components?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
            request.url = components?.url
        }
        return request
    }
}
