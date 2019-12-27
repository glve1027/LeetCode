//
//  LeetCode_.swift
//  Coding
//
//  Created by GongHuan on 2019/12/27.
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result: [[Int]] = []
        var initDatas: [TreeNode] = [root]
        var fromLeftDirection: Bool = true

        printRootByLevel(&initDatas, &result, &fromLeftDirection)

        return result
    }

    private func printRootByLevel(_ initDatas: inout [TreeNode], _ result: inout [[Int]], _ fromLeftDirection: inout Bool) {
        guard !initDatas.isEmpty else { return }

        var temp: [TreeNode] = []
        var tempResult: [Int] = []
        for t in initDatas {
            tempResult.append(t.val)
            if fromLeftDirection == true {
                if let l = t.left {
                    temp.insert(l, at:0)
                }
                if let r = t.right {
                    temp.insert(r, at: 0)
                }
            } else {
                if let r = t.right {
                    temp.insert(r, at: 0)
                }
                if let l = t.left {
                    temp.insert(l, at:0)
                }
            }
        }

        if (!tempResult.isEmpty) { result.append(tempResult) }

        var direction: Bool = fromLeftDirection == true ? false : true

        printRootByLevel(&temp, &result, &direction)
    }
}
