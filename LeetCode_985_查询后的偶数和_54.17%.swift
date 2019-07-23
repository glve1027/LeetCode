//
//  LeetCode_985_查询后的偶数和_54.17%.swift
//  TT
//
//  Created by 龚欢 on 2019/7/24.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        guard !A.isEmpty, !queries.isEmpty else { return [] }
        var A: [Int] = A
        // 所有的偶数存放的一个Map中
        var even: [Int: Int] = [:]
        // 所有的偶数和
        var fistEvenTotal: Int = 0
        for i in 0..<A.count {
            if (A[i] % 2 == 0) {
                even[i] = A[i]
                fistEvenTotal += A[i]
            }
        }
        
        var result: [Int] = []
        for arr in queries {
            guard arr.count == 2, let first = arr.first, let last = arr.last else { continue }
            let temp = A[last]
            let added = temp + first
            if (added % 2 == 0) {
                if let _ = even[last] {
                    fistEvenTotal = fistEvenTotal + added - temp
                } else {
                    fistEvenTotal = fistEvenTotal + added
                    even[last] = added
                }
            } else {
                if let _ = even[last] {
                    fistEvenTotal = fistEvenTotal - temp
                    even.removeValue(forKey: last)
                }
            }
            A[last] = added
            result.append(fistEvenTotal)
        }
        
        return result
    }
}
