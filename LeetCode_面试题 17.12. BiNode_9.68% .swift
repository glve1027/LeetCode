//
//  LeetCode_面试题 17.12. BiNode_9.68% .swift
//  Coding
//
//  Created by GH on 2020/6/14.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

// 递归
class Solution {
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let l = convertBiNode(root.left)
        let r = convertBiNode(root.right)
        
        let rightResult = TreeNode(root.val)
        rightResult.right = r
        
        guard var leftTemp = l else { return rightResult }
        let leftResult = leftTemp
        
        while leftTemp.right != nil {
            leftTemp = leftTemp.right!
        }
        
        leftTemp.right = rightResult
        
        return leftResult
    }
}
