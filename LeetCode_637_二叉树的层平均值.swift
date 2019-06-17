//
//  LeetCode_637.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/1.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var res: [Double] = []
        for arrayData in levelOrderBottom(root) {
            res.insert(getArerageBy(arrayData), at:0)
        }
        return res
    }
    
    private func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var leftData = levelOrderBottom(root.left)
        var rightData = levelOrderBottom(root.right)
        if leftData.isEmpty && rightData.isEmpty {
            return [[root.val]]
        } else if leftData.count > rightData.count {
            for _ in 0..<(leftData.count - rightData.count) {
                rightData.insert([], at: 0)
            }
        } else if rightData.count > leftData.count {
            for _ in 0..<(rightData.count - leftData.count) {
                leftData.insert([], at: 0)
            }
        }
        
        var temp: [[Int]] = []
        for i in 0..<leftData.count {
            temp.append(leftData[i] + rightData[i])
        }
        temp.append([root.val])
        
        return temp
    }
    
    private func getArerageBy(_ arr: [Int]) -> Double {
        var sum = 0
        _ = arr.map { sum += $0 }
        return Double(sum)/Double(arr.count)
    }
}
