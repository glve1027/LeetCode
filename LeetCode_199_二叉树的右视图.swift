//
//  LeetCode_.swift
//  Coding
//
//  Created by GongHuan on 2019/12/25.
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var datas: [TreeNode] = [root]
        var result: [Int] = [root.val]
        var currentLevel: Int = 1

        printRight(&datas, &result, &currentLevel)
        return result
    }

    private func printRight(_ datas: inout [TreeNode], _ result: inout [Int], _ level: inout Int) {
        guard !datas.isEmpty else { return }

        // 记录层数
        level += 1

        var tempDatas: [TreeNode] = []
        for d in datas {
            // 下一个循环要检查的子数，这里都要记录下来
            if let r = d.right {
                tempDatas.append(r)
                if result.count < level { result.append(r.val) }
            }
            if let l = d.left {
                tempDatas.append(l)
                if result.count < level { result.append(l.val) }
            }
        }

        printRight(&tempDatas, &result, &level)
    }
}
