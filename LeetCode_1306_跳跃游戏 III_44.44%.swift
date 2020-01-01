//
//  LeetCode_1306_跳跃游戏 III_44.44%.swift
//  Coding
//
//  Created by GH on 2020/1/1.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        guard !arr.isEmpty else { return false }
        guard (start >= 0 && start <= arr.count - 1) else { return false }
        if (arr[start] == 0) { return true }
        
        
        var visited: [Int] = []
        var targetIndex: [Int] = []
        for i in 0..<arr.count where arr[i] == 0 {
            targetIndex.append(i)
        }
        guard targetIndex.count >= 0 else { return false }

        return helper(arr, start, &visited, targetIndex)
    }

    private func helper(_ arr: [Int], _ start: Int, _ visited: inout [Int], _ targetIndex: [Int]) -> Bool {
        if (start < 0 || start >= arr.count) { return false }
        if (targetIndex.contains(start)) { return true }
        if (visited.contains(start)) { return false }
        
        // 保存访问记录
        visited.append(start)

        // 开始判断
        let op1 = start + arr[start]
        let op2 = start - arr[start]

        return helper(arr, op1, &visited, targetIndex) || helper(arr, op2, &visited, targetIndex)
    }
}
