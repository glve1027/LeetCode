//
//  LeetCode_1.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/5.
//  Copyright © 2019 龚欢. All rights reserved.
//

class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        guard !cpdomains.isEmpty else { return [] }
        
        var map: [String: Int] = [:]
        var result: [String] = []
        for cp in cpdomains {
            // 1. 保存最小一级子域名
            let spDatas = cp.components(separatedBy: " ")
            guard spDatas.count == 2, let first = spDatas.first, let last = spDatas.last else { continue }
            
            if var count = map[last], let f = Int(first) {
                count += f
                map[last] = count
            } else {
                map[last] = Int(first)
            }
            
            // 2.
            for s in convert2Arr(cp) {
                if var count = map[s], let f = Int(first) {
                    count += f
                    map[s] = count
                } else {
                    map[s] = Int(first)
                }
            }
        }
        
        // 3.
        for (k, v) in map { result.append("\(v) \(k)") }
        
        return result
    }
    
    private func convert2Arr(_ s: String) -> [String] {
        var splitDatas = s.components(separatedBy: ".")
        var result: [String] = []
        for i in 0..<splitDatas.count {
            if (i == 0) { 
                continue 
            } else {
                result.append(splitDatas[i..<splitDatas.count].joined(separator:"."))
            }
        }
        return result
        
    }
}
