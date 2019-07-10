//
//  LeetCode_347_前K个高频元素.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result: [Int: Int] = [:]
        for n in nums {
            if var count = result[n] {
                count += 1
                result[n] = count
            } else {
                result[n] = 1
            }
        }
        let temp = result.sorted { $0.value > $1.value }
        var finalDatas: [Int] = []
        for t in temp {
            if (finalDatas.count < k) {
                finalDatas.append(t.key)
            } else {
                return finalDatas
            }
        }
        return finalDatas
    }
}
