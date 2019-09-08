//
//  LeetCode_266_回文排列_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/8.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        let datas = Array(s)
        guard !datas.isEmpty else { return false }
        var map: [Character: Int] = [:]
        for i in 0..<datas.count {
            let currentChar = datas[i]
            if var count = map[currentChar] {
                count += 1
                map[currentChar] = count
            } else {
                map[currentChar] = 1
            }
        }
        
        return map.filter { $0.value % 2 != 0 }.count <= 1
    }
}
