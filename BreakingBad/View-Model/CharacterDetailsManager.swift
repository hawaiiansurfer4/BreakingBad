//
//  CharacterDetailsManager.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/27/22.
//

import UIKit
import Alamofire
import AlamofireImage

struct CharacterDetailsManager {
    var image: UIImage
    var name: String
    var occupation: [String]
    var nickname: String
    var status: String
    
    var characterDetailsVC = CharacterDetailsVC()
    var characterTableVC = CharacterTableVC()
    func fetchCurrentChar(indexPath: IndexPath) {
        AF.request(characterTableVC.imageArray[indexPath.row]).responseImage { response in
            if case .success(let image) = response.result {
                characterDetailsVC.imageView.image = image
            }
        }
        characterDetailsVC.nameLabel.text = characterTableVC.nameArray[indexPath.row]
//        characterDetailsVC.nicknameLabel.text
    }
}
