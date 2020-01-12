//
//  LeetCode_111. Minimum Depth of Binary Tree_67.88%.swift
//  Coding
//
//  Created by GH on 2020/1/12.
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var deep: Int = 1
        bfs([root], &deep)
        
        return deep
    }
    
    // bfs
    private func bfs(_ initDatas: [TreeNode], _ currentDeep: inout Int) {
        guard !initDatas.isEmpty else { return }
        
        var tempChildNodes: [TreeNode] = []
        // collect child nodes
        for node in initDatas {
            // has finded the nearest leaf node
            if node.left == nil && node.right == nil { return }
            if let l = node.left { tempChildNodes.append(l) }
            if let r = node.right { tempChildNodes.append(r) }
        }
        
        if (!tempChildNodes.isEmpty) {
            currentDeep += 1
            bfs(tempChildNodes, &currentDeep)
        }
    }
}
