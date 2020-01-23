//
//  LeetCode_1315. Sum of Nodes with Even-Valued Grandparent_60.53%.swift
//  Coding
//
//  Created by GH on 2020/1/23.
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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var result: Int = 0
        _ = dfs(root, [root.val], &result)
        return result
    }
    
    private func dfs(_ root: TreeNode?, _ pre: [Int], _ result: inout Int) -> Int {
        guard let root = root else { return 0 }
        
        result += findGrandParentValue(pre)
     
        var preL = pre
        if let l = root.left { preL.append(l.val) }
        
        var preR = pre
        if let r = root.right { preR.append(r.val) }
        
        return dfs(root.left, preL, &result) + dfs(root.right, preR, &result)
    }
    
    private func findGrandParentValue(_ pre: [Int]) -> Int {
        guard pre.count >= 3 else { return 0 }
        return pre[pre.count - 3] % 2 == 0 ? pre[pre.count - 1] : 0
    }
}
