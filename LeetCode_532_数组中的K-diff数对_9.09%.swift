//
//  LeetCode_532_数组中的K-diff数对_9.09%.swift
//  TT
//
//  Created by 龚欢 on 2019/7/25.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty, k >= 0 else { return 0 }
        var temp: [Int: Int] = [:]
        // 存入到HashMap
        _ = nums.map {
            if var count = temp[$0] {
                count += 1
                temp[$0] = count
            } else {
                temp[$0] = 1
            }
        }
        
        var result: Set<[Int]> = []
        _ = nums.map {
            var t = temp
            if var count = t[$0] {
                if (count == 1) {
                    t.removeValue(forKey: $0)
                } else {
                    count -= 1
                    t[$0] = count
                }
            }
            if let _ = t[$0+k] { result.insert([$0, $0+k]) }
            if let _ = t[$0-k] { result.insert([$0-k, $0]) }
        }
        
        return result.count
    }
}
