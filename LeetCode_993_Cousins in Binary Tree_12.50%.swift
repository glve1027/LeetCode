//
//  LeetCode_993_Cousins in Binary Tree_12.50%.swift
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        
        return bfs([root], x, y)
    }
    
    private func bfs(_ initDatas: [TreeNode], _ x: Int, _ y: Int) -> Bool {
        guard !initDatas.isEmpty else { return false }
        
        var nextTreeNodes: [TreeNode] = []
        var find: [Int] = []
        for node in initDatas {
            // if node has two child nodes
            if node.left != nil && node.right != nil {
                if ((node.left!.val == x && node.right!.val == y) || (node.left!.val == y && node.right!.val == x)) { return false }
            }
            
            if let l = node.left {
                if l.val == x {
                    find.append(x)
                } else if l.val == y {
                    find.append(y)
                }
                nextTreeNodes.append(l)
            }

            if let r = node.right {
                if r.val == x {
                    find.append(x)
                } else if r.val == y {
                    find.append(y)
                }
                nextTreeNodes.append(r)
            }

            // check datas is success
            if (find.count == 2) { return true }
        }
        
        // check datas is success
        if (find.count == 1) {
            return false
        } else if find.count == 1 {
            return true
        }
        
        return bfs(nextTreeNodes, x, y)
    }
}
