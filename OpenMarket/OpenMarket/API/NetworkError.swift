//
//  NetworkError.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/26.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL."
    case unableToCompleteRequest = "Unable to complete request. Check network connection."
    case invalidResponse = "Invalid response from the server."
    case invalidData = "Data recieved from server is invalid."
    case unableToDecodeData = "Unable to decode data."
    case serverNotHealthy = "API server is not healthy."
}
