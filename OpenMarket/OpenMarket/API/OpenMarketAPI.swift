//
//  OpenMarketService.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/24.
//

import Foundation

class OpenMarketAPI {
    static let shared: OpenMarketAPI = OpenMarketAPI()
    
    private init() {}
    
    func checkHealth(completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.healthCheckerURL
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error: Error = error {
                completion(.error(error.localizedDescription))
                return
            }

            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.error("Network Fail"))
                return
            }
            
            guard let data = data, String(decoding: data, as: UTF8.self) == "\"OK\"" else {
                completion(.success(false))
                return
            }
            completion(.success(true))
        }.resume()
    }
    
    func getProductList(pageNo: Int, itemsPerPage: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "?page_no=\(pageNo)&items_per_page=\(itemsPerPage)"
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error: Error = error {
                completion(.error(error.localizedDescription))
                return
            }
            
            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.error("Network Fail"))
                return
            }

            guard let data: Data = data, let decodedData: ProductListData = try? JSONDecoder().decode(ProductListData.self, from: data) else {
                completion(.error("Unable to decode data"))
                return
            }
            completion(.success(decodedData))
        }.resume()
    }
    
    func lookupProductDetail(productId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let urlString: String = APIConstants.productLookupURL + "/\(productId)"
        guard let url: URL = URL(string: urlString) else {
            completion(.error("Not able to create URL"))
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error: Error = error {
                completion(.error(error.localizedDescription))
                return
            }
            
            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.error("Network Fail"))
                return
            }
            
            guard let data: Data = data, let decodedData: ProductData = try? JSONDecoder().decode(ProductData.self, from: data) else {
                completion(.error("Unable to decode data"))
                return
            }
            completion(.success(decodedData))
        }.resume()
    }
}
 
