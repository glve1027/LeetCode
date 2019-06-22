//
//  LeetCode_561_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/22.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var sortedData = nums.sorted { $0 < $1 }
        var res: Int = 0
        for i in stride(from:0, to: nums.count, by: 2) {
            res += sortedData[i]
        }
        return res
    }
}
