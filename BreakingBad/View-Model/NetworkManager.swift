//
//  NetworkManager.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import Foundation

class NetworkManager {
    let url = "https://breakingbadapi.com/api/characters"
    
    func performRequest() {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, resp, error in
            guard error != nil else { return }
            
            if let safeData = data {
                parseJSON(safeData)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedJSON = try decoder.decode(CharacterModel.self, from: data)
            
        } catch {
            fatalError("Failed to decode the JSON")
        }
    }
}
