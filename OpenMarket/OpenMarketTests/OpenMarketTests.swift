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
                    XCTFail("Test fail: API Health Not OK")
                    return
                }
                XCTAssertTrue(healthdata)
            case .error(let errorMessage):
                if let errorMessage: String = errorMessage as? String {
                    print(errorMessage)
                }
                XCTFail("Test Fail: Network Error")
            }
        }
        sleep(1)
    }
    
    func test_get_product_list_api() {
        OpenMarketAPI.shared.getProductList(pageNo: 1, itemsPerPage: 10) { networkResult in
            switch networkResult {
            case .success(let productListData):
                let productList: ProductListData? = productListData as? ProductListData
                XCTAssertNotNil(productList)
            case .error(let errorMessage):
                if let errorMessage: String = errorMessage as? String {
                    print(errorMessage)
                }
                XCTFail("Test fail: Network Error")
            }
        }
        sleep(1)
    }
    
    func test_get_product_detail_api() {
        OpenMarketAPI.shared.lookupProductDetail(productId: 522) { networkResult in
            switch networkResult {
            case .success(let productData):
                let productData: ProductData? = productData as? ProductData
                XCTAssertNotNil(productData)
            case .error(let errorMessage):
                if let errorMessage: String = errorMessage as? String {
                    print(errorMessage)
                }
                XCTFail("Test fail: Network Error")
            }
        }
        sleep(1)
    }
}
