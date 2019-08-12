//
//  LeetCode_205_同构字符串.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/12.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

// 效率42%  : 1. 解法1

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let s1 = convert2Map(s)
        let t1 = convert2Map(t)
        guard s1.count == t1.count else { return false }
        for (_, v) in s1 {
            if (!t1.values.contains(v)) { return false }
        }
        return true
    }
    
    private func convert2Map(_ s: String) -> [Character: [Int]] {
        var result: [Character: [Int]] = [:]
        let datas = Array(s)
        for i in 0..<datas.count {
            let ch = datas[i]
            if var arr = result[ch] {
                arr.append(i)
                result[ch] = arr
            } else {
                result[ch] = [i]
            }
        }
        return result
    }
}

// 效率：76.92% 解法2
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        return convert2Arr(s) == convert2Arr(t)
    }
    
    private func convert2Arr(_ s: String) -> [Int] {
        let datas = Array(s)
        guard !datas.isEmpty else { return [] }
        var map: [Character: Int] = [:]
        var result: [Int] = []
        for i in 0..<datas.count {
            let ch: Character = datas[i]
            if let lastIndex = map[ch] {
                result.append(lastIndex)
            } else {
                result.append(i)
                map[ch] = i
            }
        }
        return result
    }
}
