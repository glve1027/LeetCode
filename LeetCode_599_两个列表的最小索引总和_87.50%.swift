//
//  LeetCode_599_两个列表的最小索引总和.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/11.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        let m1 = conver2Map(list1)
        let m2 = conver2Map(list2)
        
        var result: [Int: [String]] = [:]
        var totalIndex: Int? = nil
        for v1 in list1 {
            // 这里不要使用list2.contains(xx) -> 效率比较低
            // 用HashMap替代会明显提高效率
            if let _ = m2[v1] {
                guard let count1 = m1[v1], let count2 = m2[v1] else { continue }
                let index = count1 + count2
                
                if var datas = result[index] {
                    datas.append(v1)
                    result[index] = datas
                } else {
                    result[index] = [v1]
                }
                
                if ((totalIndex == nil) || (totalIndex != nil && index < totalIndex!)) {
                    totalIndex = index
                }
            }
        }
        
        if totalIndex == nil { return [] }
        
        return result[totalIndex!] ?? []
    }
    
    private func conver2Map(_ from: [String]) -> [String: Int] {
        var map: [String: Int] = [:]
        for i in 0..<from.count {
            map[from[i]] = i
        }
        return map
    }
}
