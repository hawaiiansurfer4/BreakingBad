//
//  CharacterData.swift
//  BreakingBad
//
//  Created by Sean Murphy on 5/24/22.
//

import Foundation

struct CharacterData {
    var name: [String]
    var imageURLArray: [URL]
    var occupationMatrix: [[String]]
    var status: [String]
    var nickname: [String]
    var seasonApperance: [[Int]]
    
    mutating func clearData() {
        self.name.removeAll()
        self.imageURLArray.removeAll()
        self.occupationMatrix.removeAll()
        self.status.removeAll()
        self.nickname.removeAll()
        self.seasonApperance.removeAll()
    }
}
