//
//  CharacterVC.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//


import UIKit
import Alamofire
import AlamofireImage

class CharacterVC: UITableViewController {
    
    @IBOutlet weak var filterButton: UINavigationItem!
    
    var characterListViewModel = CharacterListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        loadCharacters()

    }
    
    func loadCharacters() {
        guard let charactersURL = URL(string: "https://breakingbadapi.com/api/characters") else {
            fatalError("URL was incorrect")
        }
        let resource = Resource<[Character]>(url: charactersURL)
        
        WebServie().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let character):
                self?.characterListViewModel.charactersViewModel = character.map(CharacterViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.characterListViewModel.characterViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        
        cell.characterLabel.text = vm.name
        let imageURL = vm.image

        AF.request(imageURL).responseImage { response in
            if case .success(let image) = response.result {
                cell.characterImage.image = image
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterListViewModel.charactersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let character = characterListViewModel.characterViewModel(at: indexPath.row)
        
        guard let characterDetailViewController = storyboard?.instantiateViewController(identifier: "CharacterDetailsVC", creator: { coder in
            return CharacterDetailViewController(coder: coder, character: character.character)
        }) else {
            return
        }
        self.navigationController?.pushViewController(characterDetailViewController, animated: true)

    }
    

    
    
}
