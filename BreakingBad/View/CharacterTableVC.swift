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

    var imageArray = [URL]()
    var nameArray = [String]()
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        networkManager.delegate = self
        networkManager.fetchChar()
    }
    
    enum Status {
        case none
        case success
        case error
    }

    @IBOutlet weak var filterButton: UINavigationItem!

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        if nameArray.count == 0 {
            cell.characterLabel.text = "Load Characters"
            cell.characterLabel.textColor = .blue
            return cell
        } else {
            cell.characterLabel.text = nameArray[indexPath.row]
            let imageURL = imageArray[indexPath.row]
                AF.request(imageURL).responseImage { response in
                    if case .success(let image) = response.result {
                        cell.characterImage.image = image
                    }
                }

                print("Error grabbing image")

            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "characterDetailsSegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nameArray.count == 0 {
            return 1
        } else {
            return nameArray.count
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterDetailsSegue = segue.destination as? CharacterDetailsVC else { return }
    }

}


//MARK: - CharacterManagerDelegate

extension CharacterTableVC: CharacterManagerDelegate {
    func fetchCharacters(characterData: [CharacterData], networkManager: NetworkManager?) {
        DispatchQueue.main.async {
            self.nameArray.removeAll()
            self.imageArray.removeAll()
            for i in 0..<characterData.count {
                self.imageArray.append(contentsOf: characterData[i].imageURLArray)
                self.nameArray.append(contentsOf: characterData[i].name)
                self.tableView.reloadData()
            }
        }
    }
}
