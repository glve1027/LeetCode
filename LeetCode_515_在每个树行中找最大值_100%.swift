//
//  LeetCode_515_在每个树行中找最大值_100%.swift
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var initDatas: [TreeNode] = [root]
        var result: [Int] = [root.val]

        findMax(&initDatas, &result)

        return result
    }

    private func findMax(_ initDatas: inout [TreeNode], _ result: inout [Int]) {
        guard !initDatas.isEmpty else { return }

        var nextLevelNodes: [TreeNode] = []
        var currentNodeValue: Int? = nil
        for n in initDatas {
            if let l = n.left{
                nextLevelNodes.append(l)
                if currentNodeValue == nil {
                    currentNodeValue = l.val
                } else if currentNodeValue! < l.val {
                    currentNodeValue = l.val
                }
            }
            if let r = n.right {
                nextLevelNodes.append(r)
                if currentNodeValue == nil {
                    currentNodeValue = r.val
                } else if currentNodeValue! < r.val {
                    currentNodeValue = r.val
                }
            }
        }

        //
        if currentNodeValue != nil { result.append(currentNodeValue!) }

        findMax(&nextLevelNodes, &result)
    }
}
