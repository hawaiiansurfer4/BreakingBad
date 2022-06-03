//
//  CharacterViewModel.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//

import Foundation
import CoreData


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
