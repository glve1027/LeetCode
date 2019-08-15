//
//  LeetCode_387_字符串中的第一个唯一字符_53.52%.swift
//  Coding
//
//  Created by GongHuan on 2019/8/15.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var map: [Character: [Int]] = [:]
        
        let datas = Array(s)
        guard !datas.isEmpty else { return -1 }
        
        for i in 0..<datas.count {
            if var arr = map[datas[i]] {
                arr.append(i)
                map[datas[i]] = arr
            } else {
                map[datas[i]] = [i]
            }
        }
        
        var index: Int? = nil
        for (_, v) in map {
            if (v.count > 1) { continue }
            guard let first = v.first else { continue }
            if index == nil {
                index = first
            } else {
                index = min(index!, first)
            }
        }
        return index ?? -1
    }
}
