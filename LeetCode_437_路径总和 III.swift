//
//  LeetCode_437_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/9.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

/*
 ** DFS
 */
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        return helper(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }

    /*
     ** DFS
     */
    private func helper(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var count: Int = 0
        if (root.val == sum) { count += 1 }
        count += helper(root.left, sum - root.val)
        count += helper(root.right, sum - root.val)
        return count
    }
}

/*
 ** 超出时间限制
 */
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        _ = findPath(root, sum)
        return res.count
    }
    
    var res: [[Int]] = []
    private func findPath(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        if root.left == nil && root.right == nil {
            if (root.val == sum) { res.append([root.val]) }
            return [[root.val]]
        }
        let l = findPath(root.left, sum)
        let r = findPath(root.right, sum)
        var willReturnData: [[Int]] = []
        for d in l {
            var temp = d
            temp.append(root.val)
            if (calculateSum(by: temp) == sum) { res.append(temp) }
            willReturnData.append(temp)
        }
        for d in r {
            var temp = d
            temp.append(root.val)
            if (calculateSum(by: temp) == sum) { res.append(temp) }
            willReturnData.append(temp)
        }
        if root.val == sum { res.append([root.val]) }
        willReturnData.append([root.val])
        return willReturnData
    }
    
    /*
     ** 计算数组中所有元素的总和
     */
    private func calculateSum(by: [Int]) -> Int {
        var res: Int = 0
        _ = by.map { res += $0 }
        return res
    }
}
