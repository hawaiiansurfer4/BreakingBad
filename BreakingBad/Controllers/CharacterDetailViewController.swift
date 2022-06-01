//
//  CharacterDetailViewController.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class CharacterDetailViewController: UITableViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    init?(coder: NSCoder, character: Character) {
        self.character = character
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var character: Character
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        nameLabel.text = character.name
        nicknameLabel.text = character.nickname
        occupationLabel.text = character.occupation.joined(separator: ",")
        statusLabel.text = character.status
        var charAppear = character.occupation
        appearanceLabel.text = charAppear.joined(separator: ",")
        let imageURL = character.img
        AF.request(imageURL).responseImage { response in
            if case .success(let image) = response.result {
                self.imageView.image = image
            }
        }
    }
}
