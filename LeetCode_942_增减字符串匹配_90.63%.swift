//
//  LeetCode_942_增减字符串匹配_90.63%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/19.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func diStringMatch(_ S: String) -> [Int] {
        let datas = Array(S)
        guard !datas.isEmpty else { return [] }
        
        var insert: [Int] = []
        for i in 0...datas.count { insert.append(i) }
        var l:Int = 0
        var r:Int = insert.count - 1
        
        var result: [Int] = []
        for ch in datas {
            if ch == Character("I") {
                result.append(insert[l])
                l += 1
            } else if ch == Character("D") {
                result.append(insert[r])
                r -= 1
            } else {
                continue
            }
        }
        result.append(insert[r])
        return result
    }
}
