//
//  LeetCode_448. 找到所有数组中消失的数字_50%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/14.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var temp: [Int: Int] = [:]
        for n in nums where !temp.keys.contains(n) { temp[n] = 1 }
        var res: [Int] = []
        for i in 0..<nums.count where !temp.keys.contains(i+1) { res.append(i+1) }
        return res
    }
}
