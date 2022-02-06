//
//  ProductData.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/24.
//

import Foundation

struct ProductData: Codable {
    let id: Int
    let vendorId: Int
    let name: String
    let thumbnail: String
    let currency: String
    let price: Double
    let bargainPrice: Double
    let discountedPrice: Int
    let stock: Int
    let createdAt: String
    let issuedAt: String
    let images: [ProductImageData]?
    let vendors: VendorData?
    
    var thumbnailImageURL: URL? {
        guard let url: URL = URL(string: thumbnail) else { return nil }
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case vendorId = "vendor_id"
        case name
        case thumbnail
        case currency
        case price
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case stock
        case createdAt = "created_at"
        case issuedAt = "issued_at"
        case images
        case vendors
    }
}
