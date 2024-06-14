//
//  NetworkServiceProtocol.swift
//  NetworkLayer
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(with endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}
