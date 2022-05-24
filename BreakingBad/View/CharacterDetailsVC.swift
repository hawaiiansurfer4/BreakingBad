//
//  ViewController.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/23/22.
//

import UIKit

class CharacterDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var listofDetails = ["Occupation", "Status", "Nickname", "Season Appearance", "Portrayed"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetails", for: indexPath)
//        cell.textLabel?.text =
        for detail in 2..<detailsArray.count {
            cell.textLabel?.text = listofDetails[detail]
        }
        return cell
    }


}

