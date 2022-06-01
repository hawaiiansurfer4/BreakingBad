//
//  Character.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/31/22.
//

import Foundation

struct Character: Codable {
    let name: String
    let occupation: [String]
    let status: String
    let nickname: String
    let appearance: [Int]
    let img: URL
}
