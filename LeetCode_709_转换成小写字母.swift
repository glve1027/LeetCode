//
//  LeetCode_709.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/22.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func toLowerCase(_ str: String) -> String {
        var characters: [Character] = []
        let temp: [String: String] = ["A": "a", "B": "b", "C": "c", "D": "d", "E": "e", "F": "f", "G": "g", "H": "h", "I": "i", "J": "j", "K": "k", "L": "l", "M": "m", "N": "n", "O": "o", "P": "p", "Q": "q", "R": "r", "S": "s", "T": "t", "U": "u", "V": "v", "W": "w", "X": "x", "Y": "y", "Z": "z"]
        for c in str {
            if (temp.keys.contains(String(c))) {
                characters.append(Character(temp[String(c)]!))
            } else {
                characters.append(c)
            }
        }
        return String(characters)
    }
}
