//
//  MockNetworkManager.swift
//  NetworkLayerTests
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation
import NetworkLayer

class MockNetworkManager: NetworkServiceProtocol {
    static let shared = MockNetworkManager()
    private init() {}
    
    func request<T>(with endpoint: NetworkLayer.Endpoint, completion: @escaping (Result<T, NetworkLayer.NetworkError>) -> Void) where T : Decodable {
        let json = """
        {
            "id": 1,
            "name": "Noor",
            "body": "Test"
        }
        """
        let data = Data(json.utf8)
        let response = try! JSONDecoder().decode(T.self, from: data)
        completion(.success(response))
    }
    
    func request<T: Decodable>(with endpoint: Endpoint) async -> Result<T, NetworkError> {
        let json = """
        {
            "id": 1,
            "name": "Noor",
            "body": "Test"
        }
        """
        let data = Data(json.utf8)
        let response = try! JSONDecoder().decode(T.self, from: data)
        return .success(response)
    }
}
