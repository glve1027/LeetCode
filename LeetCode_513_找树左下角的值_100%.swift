//
//  LeetCode_513_找树左下角的值_100%.swift
//  Coding
//
//  Created by GH on 2019/12/28.
//  Copyright © 2019 GH. All rights reserved.
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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }

        var initDatas: [TreeNode] = [root]

        return findLastLevelLeft(&initDatas)
    }

    private func findLastLevelLeft(_ initDatas: inout [TreeNode]) -> Int {
        guard !initDatas.isEmpty else { return -1 }

        var temp: [TreeNode] = []
        for t in initDatas {
            if let l = t.left { temp.append(l) }
            if let r = t.right { temp.append(r) }
        }

        if temp.isEmpty {
            if let firstNode = initDatas.first {
                return firstNode.val
            }
            return -1
        } else {
            return findLastLevelLeft(&temp)
        }
    }
}
