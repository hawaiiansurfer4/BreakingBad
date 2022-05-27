//
//  NetworkManager.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import UIKit
import Alamofire
import AlamofireImage

protocol CharacterManagerDelegate {
    func fetchCharacters(characterData: [CharacterData], networkManager: NetworkManager?)
}

let urlString = "https://breakingbadapi.com/api/characters"

struct NetworkManager {

    var delegate: CharacterManagerDelegate?
    func fetchChar() {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        performRequest(url: url)
    }
    
    func performRequest(url: URL) {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, resp, error in
            guard error == nil else { return }
            var nameArray = [String]()
            var occupationArray = [[String]]()
            var imageURLArray = [URL]()
            var statusArray = [String]()
            var nicknameArray = [String]()
            var appearanceArray = [[Int]]()
            var portrayedArray = [String]()
            if let safeData = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode([Character].self, from: safeData)
                    for i in 0..<response.count {
                        nameArray.append(response[i].name)
                        occupationArray.append(response[i].occupation)
                        imageURLArray.append(response[i].img)
                        statusArray.append(response[i].status)
                        nicknameArray.append(response[i].nickname)
                        appearanceArray.append(response[i].appearance)
                        portrayedArray.append(response[i].portrayed)
                    }
                    let characterReturn = CharacterData(name: nameArray, imageURLArray: imageURLArray, occupationMatrix: occupationArray, status: statusArray, nickname: nicknameArray, seasonApperance: appearanceArray)
                    self.delegate?.fetchCharacters(characterData: [characterReturn], networkManager: self)
                } catch {
                    fatalError()
                }
                
            }
        }
        task.resume()
    }
}
