//
//  CharacterViewModel.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//

import Foundation
import CoreData

//class MemoryPersistence {
//    var characterModel = CharacterModel()
//
//    func saveChar() {
//        guard let charactersURL = URL(string: "https://breakingbadapi.com/api/characters") else {
//            fatalError("URL was incorrect")
//        }
//        let resource = Resource<[Character]>(url: charactersURL)
//
//        WebServie().load(resource: resource) { [weak self] result in
//            switch result {
//            case .success(let character):
//                for i in character {
//                    self!.characterModel.name = i.name
//                    self!.characterModel.nickname = i.nickname
//                    self!.characterModel.occupation = i.occupation.joined(separator: ",")
//                    self?.characterModel.status = i.status
//                    var appear = ""
//                    for j in i.appearance {
//                        appear += String(j)
//                    }
//                    self!.characterModel.appearance = appear
//                    do {
//                        if let urlString = try? String(contentsOf: i.img) {
//                            self!.characterModel.imageURL = urlString
//                        }
//                    } catch {
//                        print("couldn't convert url to string")
//                    }
//
//                }
//                print("HERE **** is the characterModel \(self!.characterModel)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}

struct CharacterListViewModel {
    var charactersViewModel: [CharacterViewModel]
    
    init() {
        self.charactersViewModel = [CharacterViewModel]()
    }
}

extension CharacterListViewModel {
    
    func characterViewModel(at index: Int) -> CharacterViewModel {
        return self.charactersViewModel[index]
    }
    
}

struct CharacterViewModel {
    let character: Character
}

extension CharacterViewModel {
    
    var name: String {
        return self.character.name
    }
    
    var image: URL {
        return self.character.img
    }
    
    var occupation: [String] {
        return self.character.occupation
    }
    
    var status: String {
        return self.character.status
    }
    
    var nickname: String {
        return self.character.nickname
    }
    
    var appearance: [Int] {
        return self.character.appearance
    }
}
