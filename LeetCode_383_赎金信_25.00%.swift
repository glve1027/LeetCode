//
//  LeetCode_383_赎金信_25.00%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/2.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let mDatas: [Character] = Array(magazine)
        var map: [Character: Int] = [:]
        for m in mDatas {
            if var count = map[m] {
                count += 1
                map[m] = count
            } else {
                map[m] = 1
            }
        }
        
        let rDatas: [Character] = Array(ransomNote)
        for r in rDatas {
            if var count = map[r] {
                count -= 1
                if (count == 0) {
                    map.removeValue(forKey: r)
                } else {
                    map[r] = count
                }
            } else {
                return false
            }
        }
        return true
    }
}
