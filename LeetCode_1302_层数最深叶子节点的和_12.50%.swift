//
//  LeetCode_1302_层数最深叶子节点的和_12.50%.swift
//  Coding
//
//  Created by GH on 2020/1/4.
//  Copyright © 2020 GH. All rights reserved.
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var initDatas: [TreeNode] = [root]
        var value: Int = 0

        findDeepestNode(initDatas, &value)

        return value
    }

    private func findDeepestNode(_ initDatas: [TreeNode], _ value: inout Int) {
        guard !initDatas.isEmpty else { return }

        var temp: [TreeNode] = []
        var tempValue: Int = 0
        for n in initDatas {
            tempValue += n.val
            if let l = n.left { temp.append(l) }
            if let r = n.right { temp.append(r) }
        }

        if temp.isEmpty {
            value = tempValue
        } else {
            findDeepestNode(temp, &value)
        }
    }
}
