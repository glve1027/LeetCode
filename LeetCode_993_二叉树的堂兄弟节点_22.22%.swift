//
//  LeetCode_993_二叉树的堂兄弟节点_22.22%.swift
//  Coding
//
//  Created by GH on 2019/10/31.
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        var stack: [TreeNode] = [root]
        
        var value: [Int] = []
        var levelMap: [Int: Int] = [root.val: 0]
        var nodeMap: [Int: TreeNode] = [:]
        
        while !stack.isEmpty {
            let first = stack.removeFirst()
            guard let fl = levelMap[first.val] else { continue }
            
            if let l = first.left {
                stack.append(l)
                levelMap[l.val] = fl + 1
                nodeMap[l.val] = first
                value.append(l.val)
            }
            if let r = first.right {
                stack.append(r)
                levelMap[r.val] = fl + 1
                nodeMap[r.val] = first
                value.append(r.val)
            }
            
            if (value.contains(x) && value.contains(y)) { return false }
            if (value.isEmpty) { continue }
            value.removeAll()
        }
        
        if let x1 = levelMap[x], let y1 = levelMap[y], x1 == y1, let n1 = nodeMap[x], let n2 = nodeMap[y], n1.val != n2.val {
            return true
        }
        return false
    }
}
