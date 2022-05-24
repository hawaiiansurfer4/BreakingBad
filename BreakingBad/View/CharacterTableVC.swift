//
//  CharacterTableVC.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import UIKit

class CharacterTableVC: UITableViewController {
    
    var characterArray = [CharacterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        cell.characterLabel.text = characterArray[indexPath.row].name
        if let imageURL = characterArray[indexPath.row].image {
//            cell.characterImage.image = image
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    
}
