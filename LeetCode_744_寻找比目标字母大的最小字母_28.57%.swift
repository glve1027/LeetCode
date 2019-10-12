//
//  LeetCode_744_寻找比目标字母大的最小字母_28.57%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/12.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        guard !letters.isEmpty else { return Character("") }
        // !!!filter same value, can optimization
        var result: [Character] = []
        _ = letters.map { if (!result.contains($0)) { result.append($0) } }
        return find(result, target, 0, result.count - 1)
    }
    
    private func find(_ letters: [Character], _ target: Character, _ l: Int, _ r: Int) -> Character {
        var l = l
        var r = r
        let tValue = Int(target.asciiValue!)
        while l <= r {
            let mid = (l + r) / 2
            let midChar = letters[mid]
            let value = Int(midChar.asciiValue!)
            if (value == tValue) {
                return letters[index(mid, letters)]
            } else if (value < tValue) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return letters[index(r, letters)]
    }
    
    private func index(_ i: Int, _ letters: [Character]) -> Int {
        if (i >= 0 && i + 1 <= letters.count - 1) { return i+1 }
        return 0
    }
}

