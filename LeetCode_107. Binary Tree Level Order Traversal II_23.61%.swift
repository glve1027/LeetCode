//
//  LeetCode_107. Binary Tree Level Order Traversal II_23.61%.swift
//  Coding
//
//  Created by GH on 2020/1/19.
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = [[root.val]]
        bfs([root], &result)
        return result
    }
    
    private func bfs(_ initDatas: [TreeNode], _ result: inout [[Int]]) {
        guard !initDatas.isEmpty else { return }
        
        var nextNodes: [TreeNode] = []
        var currentLevel: [Int] = []
        for node in initDatas {
            if let l = node.left {
                currentLevel.append(l.val)
                nextNodes.append(l)
            }
            
            if let r = node.right {
                currentLevel.append(r.val)
                nextNodes.append(r)
            }
        }
        
        guard !currentLevel.isEmpty else { return }
        
        result.insert(currentLevel, at:0)
        return bfs(nextNodes, &result)
    }
}
