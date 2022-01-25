//
//  VendorData.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/25.
//

import Foundation

struct VendorData: Codable {
    let name: String
    let id: Int
    let createdAt: String
    let issuedAt: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}

