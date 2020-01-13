//
//  LeetCode_872. Leaf-Similar Trees_87.50%.swift
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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1 = root1, let root2 = root2 else { return false }
        return isSameArray(findAllLeafs(root1), findAllLeafs(root2))
    }
    
    private func findAllLeafs(_ from: TreeNode?) -> [Int] {
        guard let from = from else { return [] }
        // find leafs
        if from.left == nil && from.right == nil { return [from.val] }
        
        let leftAllLeafs = findAllLeafs(from.left)
        let rightAllLeafs = findAllLeafs(from.right)
        
        return leftAllLeafs + rightAllLeafs
    }
    
    private func isSameArray(_ from: [Int], _ to: [Int]) -> Bool {
        guard from.count == to.count else { return false }
        
        for i in 0..<from.count {
            if (from[i] != to[i]) { return false }
        }
        
        return true
    }
}
