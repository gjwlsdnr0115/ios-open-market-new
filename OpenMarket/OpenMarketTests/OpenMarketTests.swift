//
//  OpenMarketTests.swift
//  OpenMarketTests
//
//  Created by Jinwook Huh on 2022/01/24.
//

import XCTest

class OpenMarketTests: XCTestCase {
    func test_health_check_api_returns_ok() {
        OpenMarketAPI.shared.checkHealth { result in
            switch result {
            case .success(let healthy):
                XCTAssertTrue(healthy)
            case .failure(let error):
                XCTFail(error.rawValue)
            }
        }
        sleep(1)
    }
    
    func test_get_product_list_api() {        
        OpenMarketAPI.shared.getProductList(pageNo: 1, itemsPerPage: 10) { result in
            switch result {
            case .success(let productListData):
                print(productListData)
            case .failure(let error):
                XCTFail(error.rawValue)
            }
        }
        sleep(1)
    }

    func test_get_product_detail_api() {
        OpenMarketAPI.shared.lookupProductDetail(productId: 522) { result in
            switch result {
            case .success(let productData):
                print(productData)
            case .failure(let error):
                XCTFail(error.rawValue)
            }
        }
        sleep(1)
    }
}
