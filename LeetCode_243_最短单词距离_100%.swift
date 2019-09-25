//
//  LeetCode_243_最短单词距离_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/25.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        // 判空操作
        guard !words.isEmpty else { return 0 }
        // 异常判断
        guard words.contains(word1), words.contains(word2) else { return 0 }
        // key: word - value: [index]
        var w1: [Int] = []
        var w2: [Int] = []
        for i in 0..<words.count {
            let currentWord = words[i]
            if (currentWord == word1) {
                w1.append(i)
            } else if (currentWord == word2) {
                w2.append(i)
            }
        }
        return calculate(w1, w2)
    }
    
    // 计算两个几个之间最小的距离, 复杂度 N1 * N2
    private func calculate(_ d1: [Int], _ d2: [Int]) -> Int {
        var data: Int? = nil
        for i in d1 {
            for j in d2 {
                if data == nil {
                    data = abs(i-j)
                } else {
                    data = min(data!, abs(i-j))
                }
            }
        }
        return data ?? 0
    }
}
