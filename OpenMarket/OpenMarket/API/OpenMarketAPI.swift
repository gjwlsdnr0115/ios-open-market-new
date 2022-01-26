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
    
    func checkHealth(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let urlString: String = APIConstants.healthCheckerURL
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        networkService.get(from: url) { result in
            switch result {
            case .success(let data):
                let healthString: String = String(decoding: data, as: UTF8.self)
                guard healthString == "\"OK\"" else {
                    completion(.failure(.serverNotHealthy))
                    return
                }
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProductList(pageNo: Int, itemsPerPage: Int, completion: @escaping (Result<ProductListData, NetworkError>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "?page_no=\(pageNo)&items_per_page=\(itemsPerPage)"
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        networkService.get(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let productListData: ProductListData = try JSONDecoder().decode(ProductListData.self, from: data)
                    completion(.success(productListData))
                } catch {
                    completion(.failure(.unableToDecodeData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func lookupProductDetail(productId: Int, completion: @escaping (Result<ProductData, NetworkError>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "/\(productId)"
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        networkService.get(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let productData: ProductData = try JSONDecoder().decode(ProductData.self, from: data)
                    completion(.success(productData))
                } catch {
                    completion(.failure(.unableToDecodeData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
 
