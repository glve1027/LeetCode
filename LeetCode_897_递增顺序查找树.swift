//
//  LeetCode_897.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/3.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        reCollect(root)
        
        var returnNode: TreeNode? = nil
        var resNode: TreeNode? = nil
        for v in res {
            if resNode == nil {
                resNode = TreeNode(v)
                returnNode = resNode
            } else {
                resNode!.right = TreeNode(v)
                resNode = resNode!.right
            }
        }
        return returnNode
    }
    
    var res: [Int] = []
    private func reCollect(_ root: TreeNode?) {
        guard let root = root else { return }
        reCollect(root.left)
        res.append(root.val)
        reCollect(root.right)
    }
}
