//
//  CharacterTableVC.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import UIKit
import Alamofire
import AlamofireImage

class CharacterTableVC: UITableViewController {

    var imageArray = [String]()
    var nameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }

    @IBOutlet weak var filterButton: UINavigationItem!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        cell.characterLabel.text = nameArray[indexPath.row]
        if let imageURL = imageArray[indexPath.row] as? String {
                AF.request(imageURL).responseImage { (response) in
                    if case .success(let image) = response.result {
                        cell.characterImage.image = image
                    }
                }
                print("Error grabbing image")

        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterDetailVC = segue.destination as? CharacterDetailsVC else { return }
    }


}
