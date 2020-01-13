//
//  LeetCode_897. Increasing Order Search Tree_57.45%.swift
//  Coding
//
//  Created by GH on 2020/1/13.
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        // in-order
        var inOrderDatas: [Int] = []
        inorder(root, &inOrderDatas)
        
        var result: TreeNode? = nil
        var temp: TreeNode? = nil
        
        for v in inOrderDatas {
            if (result == nil) {
                temp = TreeNode(v)
                result = temp
            } else {
                temp!.right = TreeNode(v)
                temp = temp!.right
            }
        }
        
        return result
    }
    
    private func inorder(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root = root else { return }
        
        inorder(root.left, &result)
        result.append(root.val)
        inorder(root.right, &result)
    }
}
