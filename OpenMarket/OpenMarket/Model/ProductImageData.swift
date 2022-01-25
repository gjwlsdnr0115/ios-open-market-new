//
//  ProductImageData.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/25.
//

import Foundation

struct ProductImageData: Codable {
    let id: Int
    let url: String
    let thumbnailUrl: String
    let succeed: Bool
    let issuedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case thumbnailUrl = "thumbnail_url"
        case succeed
        case issuedAt = "issued_at"
    }
}
