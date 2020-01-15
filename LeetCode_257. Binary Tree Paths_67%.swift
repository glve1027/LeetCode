//
//  LeetCode_257. Binary Tree Paths_67%.swift
//  Coding
//
//  Created by GH on 2020/1/15.
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        if root.left == nil && root.right == nil { return ["\(root.val)"] }
        
        let result = binaryTreePaths(root.left) + binaryTreePaths(root.right)
        
        var temp: [String] = []
        for i in result {
            temp.append("\(root.val)->\(i)")
        }
        
        return temp
    }
}
