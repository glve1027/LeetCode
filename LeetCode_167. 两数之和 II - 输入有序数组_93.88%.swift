//
//  LeetCode_167. 两数之和 II - 输入有序数组_93.88%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/14.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = numbers.count - 1
        while start < end {
            let value = numbers[start] + numbers[end]
            if value == target {
                return [start + 1, end + 1]
            } else if value > target {
                end -= 1
            } else {
                start += 1
            }
        }
        return []
    }
}
