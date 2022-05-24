//
//  CharacterModel.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import Foundation
import UIKit

struct CharacterModel: Codable {
    let char_id: Int
    let image: String
    let name: String
    let birthday: Date
    let occupation: [String]
    let status: String
    let nickname: String
    let apperance: [Int]
    let portrayed: String
}
