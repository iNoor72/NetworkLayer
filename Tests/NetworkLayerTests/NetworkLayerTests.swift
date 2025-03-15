//
//  NetworkLayerTests.swift
//  NetworkLayerTests
//
//  Created by Noor El-Din Walid on 15/06/2024.
//

import XCTest
@testable import NetworkLayer

final class NetworkLayerTests: XCTestCase {
    func test_endpoint_creation() {
        let endpoint = MockEndpoint.mock
        guard let request = try? endpoint.asURLRequest() else {
            XCTFail()
            return
        }
        XCTAssertEqual(request.url?.absoluteString, "https://mock.com/test")
        XCTAssertEqual(request.url?.path(), "/test")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNotNil(request.allHTTPHeaderFields?.isEmpty)
        XCTAssertNil(request.httpBody)
    }
    
    func test_request() {
        let endpoint = MockEndpoint.mock
        let networkManager = MockNetworkManager.shared
        let expectation = XCTestExpectation(description: "Request")
        
        networkManager.request(with: endpoint) { (result: Result<MockModel, NetworkError>) in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.id, 1)
                XCTAssertEqual(model.name, "Noor")
                XCTAssertEqual(model.body, "Test")
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_async_request() async {
        let endpoint = MockEndpoint.mock
        let networkManager = MockNetworkManager.shared
        
        let result: Result<MockModel, NetworkError> = await networkManager.request(with: endpoint)
        
        switch result {
        case .success(let model):
            XCTAssertEqual(model.id, 1)
            XCTAssertEqual(model.name, "Noor")
            XCTAssertEqual(model.body, "Test")
            
        case .failure(_):
            XCTFail()
        }
    }
}
