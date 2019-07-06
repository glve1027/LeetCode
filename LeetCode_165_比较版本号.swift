//
//  LeetCode_165_比较版本号.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/6.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var v1 = helper(version1)
        var v2 = helper(version2)
        if (v1.count > v2.count) {
            for _ in 0..<(v1.count-v2.count) {
                v2.append("0")
            }
        } else if (v2.count > v1.count) {
            for _ in 0..<(v2.count-v1.count) {
                v1.append("0")
            }
        }
        
        guard v1.count == v2.count else { return 0 }
        
        for i in 0..<v1.count {
            guard let n1 = Int(v1[i]), let n2 = Int(v2[i]) else { break }
            if (n1 > n2) {
                return 1
            } else if (n1 < n2) {
                return -1
            }
        }
        return 0
    }
    
    private func helper(_ v: String) -> [String] {
        return v.contains(".") ? v.components(separatedBy: ".") : [v]
    }
}
