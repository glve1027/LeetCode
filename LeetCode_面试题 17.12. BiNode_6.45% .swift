//
//  LeetCode_面试题 17.12. BiNode_6.45% .swift
//  Coding
//
//  Created by GH on 2020/6/14.
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
// 中序
class Solution {
    var temp: TreeNode? = TreeNode(-1)
    var result: TreeNode? = nil
    init() { result = temp }
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {  return result?.right }

        convertBiNode(root.left)
        temp?.right = TreeNode(root.val)
        temp = temp?.right
        convertBiNode(root.right)

        return result?.right
    }
}
