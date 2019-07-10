//
//  LeetCode_1089_复写零.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        guard !arr.isEmpty else { return }
        var result: [Int] = []
        let count = arr.count
        var startIndex: Int = 0
        while result.count < count {
            if (arr[startIndex] == 0) {
                result.append(0)
                result.append(0)
            } else {
                result.append(arr[startIndex])
            }
            startIndex += 1
        }
        // 这里可能会多一个0！！，需要去掉
        result.count == arr.count ? arr = result : (arr = Array(result[0..<arr.count]))
    }
}
