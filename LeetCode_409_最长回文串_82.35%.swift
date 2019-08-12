//
//  LeetCode_409_最长回文串_82.35%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/12.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        var result: Int = 0
        for ch in Array(s) {
            if var count = map[ch] {
                count += 1
                if (count == 2) {
                    result += 2
                    map.removeValue(forKey: ch)
                } else {
                    map[ch] = count
                }
            } else {
                map[ch] = 1
            }
        }
        
        return  map.isEmpty ? result : result + 1
    }
}
