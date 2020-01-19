//
//  LeetCode_977. Squares of a Sorted Array_59.12%.swift
//  Coding
//
//  Created by GH on 2020/1/19.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        guard !A.isEmpty else { return [] }
        
        var lIndex = 0
        var rIndex = A.count - 1
        
        var result: [Int] = []
        while lIndex <= rIndex && lIndex <= A.count - 1 && rIndex >= 0 {
            let lValue = A[lIndex] * A[lIndex]
            let rValue = A[rIndex] * A[rIndex]
            
            if lValue > rValue {
                result.insert(lValue, at: 0)
                lIndex += 1
            } else if (lValue < rValue) {
                result.insert(rValue, at: 0)
                rIndex -= 1
            } else if lIndex == rIndex {
                result.insert(lValue, at: 0)
                lIndex += 1
            } else {
                result.insert(lValue, at: 0)
                lIndex += 1
                result.insert(rValue, at: 0)
                rIndex -= 1
            }
        }
        return result
    }
}
