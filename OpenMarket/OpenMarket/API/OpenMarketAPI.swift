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
        let urlString: String = APIConstants.baseURL
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
            
            if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                guard let data: Data = data else { return }
                guard String(decoding: data, as: UTF8.self) == "OK" else {
                    completion(.success(false))
                    return
                }
                completion(.success(true))
            }
        }.resume()
    }
}
 
