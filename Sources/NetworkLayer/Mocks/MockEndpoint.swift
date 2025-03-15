//
//  MockEndpoint.swift
//  NetworkLayerTests
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation
import NetworkLayer

enum MockEndpoint: Endpoint {
    case mock
    
    var base: String {
        return "https://mock.com"
    }
    
    var path: String {
        return "/test"
    }
    
    var queryItems: [String: String]? {
        return [:]
    }
    
    var method: String {
        return "GET"
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
