//
//  CharacterModel.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import Foundation
import UIKit

struct Character: Codable {
    let name: String
//    let birthday: Date
    let occupation: [String]
    let img: URL
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
}

