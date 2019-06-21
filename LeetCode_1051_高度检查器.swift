//
//  LeetCode_1051_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/21.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var soredData = heights.sorted { $0 < $1 }
        var count: Int = 0
        for i in 0..<soredData.count {
            if (soredData[i] != heights[i]) { count += 1 }
        }
        return count
    }
}
