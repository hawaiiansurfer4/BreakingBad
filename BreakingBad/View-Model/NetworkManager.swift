//
//  NetworkManager.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import Foundation

protocol CharacterManagerDelegate {
    func didUpdateCharacter(_ charcterData: CharacterData)
    func didFailWithError(error: Error)
}

class NetworkManager {
    let urlString = "https://breakingbadapi.com/api/characters"
    
    func performRequest() {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else {
            fatalError("Error converting ")
        }
        let task = session.dataTask(with: url) { data, resp, error in
            guard error != nil else { return }
            
            if let safeData = data {
                self.parseJSON(safeData)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> CharacterData? {
        let decoder = JSONDecoder()
        var imageStringArray = [String]()
        var birthdayArray = [Date]()
        var nameArray = [String]()
        var occupation = [[String]]()
        var status = [String]()
        var nickname = [String]()
        var seasonAppearance = [[Int]]()
        do {
            let decodedJSON = try decoder.decode(CharacterModel.self, from: data)
            imageStringArray.append(contentsOf: [decodedJSON.image])
            nameArray.append(contentsOf: [decodedJSON.name])
            occupation.append(contentsOf: [decodedJSON.occupation])
            status.append(contentsOf: [decodedJSON.status])
            nickname.append(contentsOf: [decodedJSON.nickname])
            seasonAppearance.append(contentsOf: [decodedJSON.apperance])
            birthdayArray.append(contentsOf: [decodedJSON.birthday])
            var character = CharacterData(name: nameArray, birthday: birthdayArray, occupationMatrix: occupation, status: status, nickname: nickname, seasonApperance: seasonAppearance)
            return character
        } catch {
            fatalError("Failed to decode the JSON")
            return nil
        }
    }
}
