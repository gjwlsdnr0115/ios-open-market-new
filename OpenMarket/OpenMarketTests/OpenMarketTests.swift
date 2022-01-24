//
//  OpenMarketTests.swift
//  OpenMarketTests
//
//  Created by Jinwook Huh on 2022/01/24.
//

import XCTest

class OpenMarketTests: XCTestCase {
    func test_health_check_api_returns_ok() {
        OpenMarketAPI.shared.checkHealth { networkResult in
            switch networkResult {
            case .success(let healthdata):
                guard let healthdata = healthdata as? Bool else {
                    XCTFail("API Health Not OK")
                    return
                }
                XCTAssertTrue(healthdata)
            case .error(let errorMessage):
                if let errorMessage: String = errorMessage as? String {
                    print(errorMessage)
                }
                XCTFail("Network Error")
            }
        }
    }
}
