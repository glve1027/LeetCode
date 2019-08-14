//
//  LeetCode_594_最长和谐子序列_14.29%.swift
//  Coding
//
//  Created by GongHuan on 2019/8/13.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let nums = nums.sorted { $0 < $1 }
        var map: [Int: [Int]] = [:]
        for v in nums {
            if var datas = map[v] {
                datas.append(v)
                map[v] = datas
            } else {
                map[v] = [v]
            }
            
            // 再次统计一下
            if var datas = map[v-1] {
                datas.append(v)
                map[v-1] = datas
            }
        }
        // 过滤非法数据
        let result = map.filter { return dataIsOK($0.key, $0.value) }.sorted { $0.value.count > $1.value.count }.first?.value.count
        return result ?? 0
    }
    
    private func dataIsOK(_ v: Int, _ datas: [Int]) -> Bool {
        for d in datas { if (v != d) { return true } }
        return false
    }
}
