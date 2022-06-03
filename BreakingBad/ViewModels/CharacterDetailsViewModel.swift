//
//  CharacterDetailsViewModel.swift
//  BreakingBad
//
//  Created by Sean Murphy on 6/1/22.
//

import Foundation

protocol CharacterDetailsViewModelDelegate: AnyObject {
    func didFetchCharacters()
    func didFailWithError(error: Error)
}

class CharacterDetailsViewModel: NSObject {
    
    var delegate: CharacterDetailsViewModelDelegate?
    
    var characterListViewModel = CharacterListViewModel()
    private var webService: WebService!
    private(set) var characterData: [Character]! {
        didSet {
            self.bindCharacterDetailsViewModelToController()
        }
    }
    
    var bindCharacterDetailsViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.webService = WebService()
        fetchCharacterData()
    }
    
    func fetchCharacterData() {
        guard let charactersURL = URL(string: "https://breakingbadapi.com/api/characters") else {
            fatalError("URL was incorrect")
        }
        let resource = Resource<[Character]>(url: charactersURL)
        self.webService.load(resource: resource) { [weak self] result in
            switch result {
            case .success(let character):
                self?.characterListViewModel.charactersViewModel = character.map(CharacterViewModel.init)
                self?.delegate?.didFetchCharacters()
            case .failure(let error):
                print(error)
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}
