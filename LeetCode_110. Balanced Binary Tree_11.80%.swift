//
//  LeetCode_110. Balanced Binary Tree_11.80%.swift
//  Coding
//
//  Created by GH on 2020/1/18.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return  abs(getNodeMaxHeightOf(root.left) - getNodeMaxHeightOf(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    private func getNodeMaxHeightOf(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let lh = getNodeMaxHeightOf(root.left)
        let rh = getNodeMaxHeightOf(root.right)
        
        return max(lh+1, rh+1)
    }
}
