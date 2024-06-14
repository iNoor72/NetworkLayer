//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case noData
    case unknown
}
