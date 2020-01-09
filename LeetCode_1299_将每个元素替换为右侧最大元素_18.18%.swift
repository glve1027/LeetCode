//
//  LeetCode_1299_将每个元素替换为右侧最大元素_18.18%.swift
//  Coding
//
//  Created by GongHuan on 2020/1/9.
//  Copyright © 2020 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        guard !arr.isEmpty else { return [] }

        var result: [Int] = [-1]
        for i in stride(from: arr.count - 1, to: 0, by: -1) {
            guard let first = result.first else { continue }
            let currentValue = arr[i]
            currentValue > first ? result.insert(currentValue, at: 0) : result.insert(first, at: 0)
        }

        return result
    }
}
