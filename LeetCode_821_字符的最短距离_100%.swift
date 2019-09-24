//
//  LeetCode_821_字符的最短距离_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/24.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        let datas: [Character] = Array(S)
        guard !datas.isEmpty else { return [] }
        
        var eDatas: [Int] = []
        for i in 0..<datas.count where datas[i] == C {
            eDatas.append(i)
        }
        
        var result: [Int] = []
        for i in 0..<datas.count {
            let currentChar = datas[i]
            if (currentChar == C) {
                result.append(0)
            } else {
                result.append(find(i, eDatas, 0, eDatas.count - 1))
            }
        }
        return result
    }
    
    // 二分查找法
    private func find(_ index: Int, _ from: [Int], _ leftIndex: Int, _ rightIndex: Int) -> Int {
        if let minValue = from.first, minValue >= index {
            return minValue - index
        } else if let maxValue = from.last, index >= maxValue {
            return index - maxValue
        }
        var leftIndex = leftIndex
        var rightIndex = rightIndex
        while leftIndex <= rightIndex {
            let mid = (leftIndex + rightIndex) / 2
            if from[mid] > index {
                rightIndex = mid - 1
            } else if (from[mid] < index) {
                leftIndex = mid + 1
            } else {
                return mid
            }
        }
        return min(abs(index-from[leftIndex]), abs(index-from[rightIndex]))
    }
}
