//
//  APIConstants.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/24.
//

import Foundation

enum APIConstants {
    static let baseURL: String = "https://market-training.yagom-academy.kr/"
    
    static let healthCheckerURL: String = baseURL + "healthChecker"
    static let productLookupURL: String = baseURL + "api/products"
}
