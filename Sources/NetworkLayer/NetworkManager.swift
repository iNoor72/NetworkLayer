//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import Foundation

public class NetworkManager: NetworkServiceProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    public func request<T: Decodable>(with endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let session = URLSession.shared
        do {
            let request = try endpoint.asURLRequest()
            let task = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(.unknown))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            task.resume()
        } catch {
            completion(.failure(.invalidURL))
        }
    }
}