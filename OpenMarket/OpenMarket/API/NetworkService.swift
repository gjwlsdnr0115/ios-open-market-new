//
//  NetworkService.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/25.
//

import Foundation

struct NetworkService {
    func get(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _: Error = error {
                completion(.failure(.unableToCompleteRequest))
                return
            }

            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
