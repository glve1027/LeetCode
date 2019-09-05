//
//  LeetCode_760_找出变位映射_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/5.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var map: [Int: [Int]] = conver2Map(B)
        var result: [Int] = []
        for n in A {
            if var arr = map[n] {
                result.append(arr.removeFirst())
                if (arr.isEmpty) { map.removeValue(forKey:n) }
            } else {
                return []
            }
        }
        return result
    }
    
    private func conver2Map(_ B: [Int]) -> [Int: [Int]] {
        var result: [Int: [Int]] = [:]
        for i in 0..<B.count {
            if var arr = result[B[i]] {
                arr.append(i)
                result[B[i]] = arr
            } else {
                result[B[i]] = [i]
            }
        }
        return result
    }
}
