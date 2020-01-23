//
//  LeetCode_1302. Deepest Leaves Sum_36.56%.swift
//  Coding
//
//  Created by GH on 2020/1/23.
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
        return bfs([root])
    }
    
    private func bfs(_ initDatas: [TreeNode]) -> Int {
        guard !initDatas.isEmpty else { return 0 }
        
        var nextNodes: [TreeNode] = []
        var tempResult: Int = 0
        for node in initDatas {
            tempResult += node.val
            
            if let l = node.left {
                nextNodes.append(l)
            }
            if let r = node.right {
                nextNodes.append(r)
            }
        }
        
        guard !nextNodes.isEmpty else { return tempResult }
        
        return bfs(nextNodes)
    }
}
