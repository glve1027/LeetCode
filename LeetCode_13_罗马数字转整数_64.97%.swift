//
//  LeetCode_13_罗马数字转整数_64.97%.swift
//  WW
//
//  Created by 龚欢 on 2019/7/31.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let datas = Array(s)
        guard !datas.isEmpty else { return 0 }
        let map: [Character: Int] = [Character("I"): 1, Character("V"): 5, Character("X"): 10, Character("L"): 50, Character("C"): 100, Character("D"): 500, Character("M"): 1000]
        
        var lastValue: Int? = nil
        var result: Int = 0
        for v in datas {
            if let value = map[v] {
                if lastValue == nil {
                    result += value
                } else if lastValue! < value  {
                    result += (value - 2 * lastValue!)
                } else {
                    result += value
                }
                lastValue = value
            }
        }
        return result
    }
}
