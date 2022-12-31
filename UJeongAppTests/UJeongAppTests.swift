//
//  UJeongAppTests.swift
//  UJeongAppTests
//
//  Created by Hamlit Jason on 2022/12/30.
//

import XCTest
@testable import UJeongApp

final class APIClientTests: XCTestCase {

    var apiClient: APIClient? // sut

    override func setUp() {
        super.setUp()
        
        apiClient = APIClient()
    }

    override func tearDown() {
        super.tearDown()
        
        apiClient = nil
    }
    
    func test_search() throws {
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let q = "RxSwift"
        let page = 1
        
        apiClient?.search(q: q, page: page) { result in
            switch result {
            case .success(let repoOrNil):
                
                
                XCTAssert(true)
                
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail("정의한 에러" + error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }
}
