//
//  LeetCode_112. Path Sum_75.69%.swift
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        // leaf nodes
        if root.left == nil && root.right == nil {
            return root.val == sum
        }
     
        var lResult: Bool = false
        if let l = root.left {
            lResult = hasPathSum(root.left, sum - root.val)
        }
        
        var rResult: Bool = false
        if let r = root.right {
            rResult = hasPathSum(root.right, sum - root.val)
        }
        
        return lResult || rResult
    }
}
