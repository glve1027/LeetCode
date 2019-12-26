//
//  LeetCode_.swift
//  Coding
//
//  Created by GongHuan on 2019/12/26.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result: [[Int]] = []
        var initDatas: [TreeNode] = [root]

        recuiseFind(&initDatas, &result)

        return result
    }

    private func recuiseFind(_ from: inout [TreeNode], _ result: inout [[Int]]) {
        guard !from.isEmpty else { return }

        var temp: [TreeNode] = []
        var tempResult: [Int] = []
        for n in from {
            tempResult.append(n.val)

            if let l = n.left {
                temp.append(l)
            }

            if let r = n.right {
                temp.append(r)
            }

        }

        result.append(tempResult)

        recuiseFind(&temp, &result)
    }
}
