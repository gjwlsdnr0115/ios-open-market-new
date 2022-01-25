//
//  OpenMarketService.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/24.
//

import Foundation

class OpenMarketAPI {
    static let shared: OpenMarketAPI = OpenMarketAPI()
    private let networkService: NetworkService = NetworkService()
    
    private init() {}
    
    func checkHealth(completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.healthCheckerURL
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        networkService.get(from: url, as: String.self) { networkResult in
            completion(networkResult)
        }
    }
    
    func getProductList(pageNo: Int, itemsPerPage: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "?page_no=\(pageNo)&items_per_page=\(itemsPerPage)"
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        networkService.get(from: url, as: ProductListData.self) { networkResult in
            completion(networkResult)
        }
    }
    
    func lookupProductDetail(productId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "/\(productId)"
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        networkService.get(from: url, as: ProductData.self) { networkResult in
            completion(networkResult)
        }
    }
}
 
