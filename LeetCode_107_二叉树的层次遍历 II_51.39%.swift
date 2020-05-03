//
//  LeetCode_107_二叉树的层次遍历 II_51.39%.swift
//  Coding
//
//  Created by GH on 2020/5/3.
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

/**
 递归调用
 */
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var lDatas = levelOrderBottom(root.left)
        var rDatas = levelOrderBottom(root.right)

        
        if (lDatas.count > rDatas.count) {
            for i in 1...(lDatas.count - rDatas.count) {
                rDatas.insert([], at: 0)
            }
        } else if (lDatas.count < rDatas.count) {
            for i in 1...(rDatas.count - lDatas.count) {
                lDatas.insert([], at: 0)
            }
        }

        //
        var combineDatas: [[Int]] = []
        for i in 0..<lDatas.count {
            let temp = lDatas[i] + rDatas[i]
            if (!temp.isEmpty) { combineDatas.append(temp) }
        }

        combineDatas.append([root.val])

        return combineDatas
    }
}

/**
 ** 层序遍历
 */
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var queue: [TreeNode] = [root]
        var levelSize: Int = 1
        var result: [[Int]] = []
        var temp: [Int] = []

        while !queue.isEmpty {
            let currentNode = queue.removeFirst()
            levelSize -= 1

            temp.append(currentNode.val)

            if let l = currentNode.left {
                queue.append(l)
            }

            if let r = currentNode.right {
                queue.append(r)
            }

            if (levelSize == 0) {
                levelSize = queue.count
                result.insert(temp, at:0)
                temp = []
            }
        }

        return result
    }
}
