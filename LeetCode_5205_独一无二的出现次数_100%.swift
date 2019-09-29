//
//  LeetCode_5205_独一无二的出现次数_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/29.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        guard !arr.isEmpty else { return false }
        var map: [Int: Int] = [:]
        _ = arr.map {
            if var count = map[$0] {
                count += 1
                map[$0] = count
            } else {
                map[$0] =  1
            }
        }
        return Set(map.values).count == map.count
    }
}
