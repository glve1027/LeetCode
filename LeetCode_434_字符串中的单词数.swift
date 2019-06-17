//
//  LeetCode_434.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/22.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func countSegments(_ s: String) -> Int {
        var res: Int = 0
        var lastCharacter : Character? = nil
        var temp = Array(s)
        for i in 0..<temp.count {
            let v = temp[i]
            
            if v == Character(" "), let last = lastCharacter, last != Character(" ") {
                res += 1
            }
            
            if (i == temp.count - 1 && v != Character(" ")) { res += 1 }
            
            lastCharacter = v
        }
        return res
    }
}
