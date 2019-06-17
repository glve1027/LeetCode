//
//  LeetCode_257.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/2.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var leftDatas = binaryTreePaths(root.left)
        var rightDatas = binaryTreePaths(root.right)
        
        if leftDatas.isEmpty && rightDatas.isEmpty {
            return ["\(root.val)"]
        }
        
        var res: [String] = []
        if !leftDatas.isEmpty {
            leftDatas = leftDatas.map { "\(root.val)->\($0)" }
            res += leftDatas
        }
        
        if !rightDatas.isEmpty {
            rightDatas = rightDatas.map { "\(root.val)->\($0)" }
            res += rightDatas
        }
        return res
    }
}
