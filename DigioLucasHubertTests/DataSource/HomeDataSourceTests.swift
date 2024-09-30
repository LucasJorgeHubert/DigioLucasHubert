//
//  HomeDataSourceTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
import XCTest
@testable import DigioLucasHubert

class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }

        guard let data = data, let response = response else {
            throw URLError(.badServerResponse)
        }

        return (data, response)
    }
}

class HomeDataSourceTests: XCTestCase {
    var dataSource: HomeDataSourceImpl?
    var sessionMock: URLSessionMock?

    override func setUp() {
        super.setUp()
        sessionMock = URLSessionMock()
        dataSource = HomeDataSourceImpl(session: sessionMock ?? URLSessionMock())
    }

    func testGetHomeDataSuccess() async throws {
        let mockData = try JSONEncoder().encode(HomeModelDTO.MOCK)
        if let url = URL(string: "https://mockurl.com") {
            let mockResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            
            self.sessionMock?.data = mockData
            self.sessionMock?.response = mockResponse
        }

        let result = try await dataSource?.getHomeData()
        
        switch result {
        case .success(let homeModel):
            XCTAssertEqual(homeModel.spotlight.count, 3)
            XCTAssertEqual(homeModel.products.count, 2)
            XCTAssertEqual(homeModel.cash.title, "Cash 1")
        case .failure:
            XCTFail("Expected success but got failure.")
        case .none:
            XCTFail("Expected success but got failure.")
        }
    }
    
    func testGetHomeDataInvalidURL() async throws {
        sessionMock?.error = URLError(.badURL)
        
        do {
            _ = try await dataSource?.getHomeData()
            XCTFail("Expected error but got success.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badURL)
        }
    }
    
    func testGetHomeDataServerError() async throws {
        if let url = URL(string: "https://mockurl.com") {
            let mockResponse = HTTPURLResponse(
                url: url,
                statusCode: 404,
                httpVersion: nil,
                headerFields: nil
            )
            
            self.sessionMock?.response = mockResponse
            self.sessionMock?.data = Data()
        }
        
        do {
            _ = try await dataSource?.getHomeData()
            XCTFail("Expected error but got success.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        }
    }
    
    func testGetHomeDataCachePolicy() async throws {
        let mockData = try JSONEncoder().encode(HomeModelDTO.MOCK)
        if let url = URL(string: "https://mockurl.com") {
            let mockResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            
            self.sessionMock?.data = mockData
            self.sessionMock?.response = mockResponse
        }

        let result1 = try await dataSource?.getHomeData()
        
        switch result1 {
        case .success(let homeModel):
            XCTAssertEqual(homeModel.spotlight.count, 3)
        case .failure:
            XCTFail("Expected success but got failure.")
        case .none:
            XCTFail("Expected success but got failure.")
        }

        self.sessionMock?.data = mockData

        let result2 = try await dataSource?.getHomeData()

        switch result2 {
        case .success(let homeModel):
            XCTAssertEqual(homeModel.spotlight.count, 3)
        case .failure:
            XCTFail("Expected success but got failure.")
        case .none:
            XCTFail("Expected success but got failure.")
        }
    }
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

struct HomeDataSourceImpl: HomeDataSourceProtocol {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getHomeData() async throws -> Result<HomeModelDTO, Error> {
        let cache = URLCache(memoryCapacity: 512_000, diskCapacity: 10_240_000, diskPath: "HomeCache")
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.urlCache = cache
        sessionConfig.requestCachePolicy = .returnCacheDataElseLoad

        guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        let homeModel = try decoder.decode(HomeModelDTO.self, from: data)

        return .success(homeModel)
    }
}
