//
//  LeetCode_521. 最长特殊序列 Ⅰ.swift
//  Coding
//
//  Created by GongHuan on 2019/7/12.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        if (a == b) { return -1 }
        guard a.count == b.count else { return max(a.count, b.count) }
        if (a.count == 0) { return b.count }
        if (b.count == 0) { return a.count }
        // a.count == b.count
        if (a != b) { return a.count }
        return max(helper(a, b), helper(b, a))
    }
    
    private func helper(_ a: String, _ b: String) -> Int {
        let aDatas = Array(a)
        let bDatas = Array(b)
        for i in 1..<aDatas.count {
            if (aDatas[i] != bDatas[i]) {
                return aDatas.count - i;
            }
        }
        return 0
    }
}
