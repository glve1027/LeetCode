//
//  LeetCode_159_至多包含两个不同字符的最长子串_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/24.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        let datas = Array(s)
        guard !datas.isEmpty else { return 0 }
        var map: [Character: Int] = [:] // hash map O(1)
        var stack: [Character] = [] // stack
        var result: Int = 0
        for c in datas {
            if var count = map[c] {
                count += 1
                map[c] = count
            } else {
                // 如果超了
                while map.count == 2 {
                    let willRemove = stack.removeFirst()
                    if var count = map[willRemove] {
                        count -= 1
                        if (count == 0) {
                            map.removeValue(forKey: willRemove)
                        } else {
                            map[willRemove] = count
                        }
                    }
                }
                map[c] = 1
            }
            result = max(result, helper(map))
            stack.append(c)
        }
        return result
    }
    
    private func helper(_ datas: [Character: Int]) -> Int {
        var result: Int = 0
        for (_, v) in datas {
            result += v
        }
        return result
    }
}
