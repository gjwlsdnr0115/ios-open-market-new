//
//  NetworkService.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/25.
//

import Foundation

struct NetworkService {
    func get<T: Codable>(from url: URL, as dataType: T.Type, completion: @escaping (NetworkResult<Any>) -> Void) {
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
            
            if dataType == String.self {
                guard let data = data, String(decoding: data, as: UTF8.self) == "\"OK\"" else {
                    completion(.success(false))
                    return
                }
                completion(.success(true))
                return
            }
            
            guard let data: Data = data, let decodedData: T = try? JSONDecoder().decode(dataType, from: data) else {
                completion(.error("Unable to decode data"))
                return
            }
            completion(.success(decodedData))
        }.resume()
    }
}
