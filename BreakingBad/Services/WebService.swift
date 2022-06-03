//
//  WebService.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//

import Foundation
import CoreData
import UIKit

enum NetworkError: Error {
    case domainError
    case decodingError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, resp, error in
            guard let safeData = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: safeData)
            
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
