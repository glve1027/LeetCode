//
//  LeetCode_522. 最长特殊序列 II_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/7/12.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        guard !strs.isEmpty else { return 0 }
        var collect: [Int: [String]] = [:]
        for v in strs {
            if var datas = collect[v.count] {
                datas.append(v)
                collect[v.count] = datas
            } else {
                collect[v.count] = [v]
            }
        }
        // sorted
        let sorted = collect.sorted { $0.key > $1.key }
        
        // error datas
        var errorDatas: [String] = []
        // for loop
        for (k, v) in sorted {
            if (helper(v) == false) {
                // 和之前的数据做对比
                if (errorDatas.count > 0) {
                    for subV in v {
                        if (findSub(errorDatas, subV) == false) { return k }
                    }
                    continue
                } else {
                    return k
                }
            } else {
                errorDatas += Array(Set(v))
            }
        }
        return -1
    }
    
    // 查找子字符
    private func findSub(_ datas: [String], _ sub: String) -> Bool {
        for d in datas {
            let dDatas = Array(d)
            let subDatas = Array(sub)
            var firstLength = 0
            var subLength = 0
            while firstLength < d.count && subLength < sub.count {
                if (dDatas[firstLength] == subDatas[subLength]) { subLength += 1 }
                firstLength += 1
            }
            if (subLength == sub.count) { return true }
        }
        return false
    }
    
    // 是否有相同的字符串
    private func helper(_ datas: [String]) -> Bool {
        var temp: [String: Int] = [:]
        for d in datas {
            if var count = temp[d] {
                count += 1
                temp[d] = count
            } else {
                temp[d] = 1
            }
        }
        return !Array(temp.values).contains(1)
    }
}
