//
//  LeetCode_1189_“气球” 的最大数量_14.29%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/2.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        let datas = Array(text)
        guard !datas.isEmpty else { return 0 }
        
        var map: [String: Int] = [:]
        let ball: [String] = ["b", "a", "l", "l", "o", "o", "n"]
        
        for char in datas where ball.contains(String(char)) {
            if var count = map[String(char)] {
                count += 1
                map[String(char)] = count
            } else {
                map[String(char)] = 1
            }
        }
        
        return findCount(ball, map, 0)
    }
    
    private func findCount(_ ball: [String], _ datas: [String: Int], _ count: Int) -> Int {
        var count = count
        var datas = datas
        var collect: [String] = []
        for s in ball {
            if var count = datas[s] {
                count -= 1
                if (count == 0) {
                    datas.removeValue(forKey:s)
                } else {
                    datas[s] = count
                }
                collect.append(s)
            } else {
                return count
            }
        }
        guard collect.count == ball.count else { return 0 }
        count += 1
        if !datas.isEmpty { return findCount(ball, datas, count) }
        return count
    }
}
