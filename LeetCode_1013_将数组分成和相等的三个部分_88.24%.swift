//
//  LeetCode_1013_将数组分成和相等的三个部分_88.24%.swift
//  TT
//
//  Created by 龚欢 on 2019/7/26.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        guard A.count >= 3 else { return false }
        let total = calculate(A, 0, A.count - 1)
        guard total % 3 == 0 else { return false }
        let space = total / 3
        
        var temp: [[Int]] = []
        var result = 0
        for i in 0..<A.count {
            result += A[i]
            if result == space {
                if temp.isEmpty {
                    temp.append([0, i])
                } else if temp.count > 3 {
                    return false
                } else if var last = temp.last {
                    last.append(i)
                    temp[temp.count - 1] = last
                }
                if (i+1 <= A.count - 1) { temp.append([i+1]) }
                result = 0
            }
            
            // 结尾的时候判断一下
            if (i == A.count - 1), let last = temp.last, last.count == 1 { temp.removeLast() }
        }
        return temp.count == 3
    }
    
    private func calculate(_ A: [Int], _ start: Int, _ end: Int) -> Int {
        guard start <= end, end <= A.count - 1 else { return 0 }
        var result: Int = 0
        for i in start...end {
            result += A[i]
        }
        return result
    }
}
