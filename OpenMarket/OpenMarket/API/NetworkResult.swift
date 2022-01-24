//
//  NetworkResult.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case error(T)
}
