//
//  LeetCode_1.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/5.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        // 判断数据不为空
        guard !candies.isEmpty else { return 0 }
        // 判断数据为偶数
        guard candies.count % 2 == 0 else { return 0 }
        // 不同的集合
        var datas: Set<Int> = Set(candies)
        return datas.count >= candies.count / 2 ? candies.count / 2 : datas.count
    }
}
