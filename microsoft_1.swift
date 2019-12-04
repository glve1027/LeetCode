//
//  microsoft_1.swift
//  Coding
//
//  Created by GongHuan on 2019/12/4.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        guard !letters.isEmpty else { return Character("") }
        let last = letters[letters.count - 1]
        if (last <= target) { return letters[0] }
        return find(letters, 0, letters.count - 1, target)
    }

    private func find(_ letters: [Character], _ leftIndex: Int, _ rightIndex: Int, _ target: Character) -> Character {
        var l = leftIndex
        var r = rightIndex
        while (l <= r) {
            let mid = (r - l)/2 + l
            let midCharacter = letters[mid]
            if midCharacter == target {
                l = mid + 1
            } else if (midCharacter < target) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        if (l <= letters.count - 1 && l >= 0) {
            return letters[l]
        }
        return letters[0]
    }
}
