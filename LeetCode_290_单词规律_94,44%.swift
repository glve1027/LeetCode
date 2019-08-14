//
//  LeetCode_290_单词规律.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/14.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        var p: [String] = []
        _ = Array(pattern).map { p.append(String($0)) }
        return convert2Arr(p) == convert2Arr(str.components(separatedBy: " "))
    }
    
    private func convert2Arr(_ s: [String]) -> [Int] {
        var result: [Int] = []
        var map: [String: Int] = [:]
        
        for i in 0..<s.count {
            if let index = map[s[i]] {
                result.append(index)
            } else {
                map[s[i]] = i
                result.append(i)
            }
        }
        return result
    }
}
