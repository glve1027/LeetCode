//
//  LeetCode_1305. 两棵二叉搜索树中的所有元素_100%.swift
//  Coding
//
//  Created by GH on 2020/1/11.
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var sorted1: [Int] = []
        var sorted2: [Int] = []
        getSortedArray(from: root1, &sorted1)
        getSortedArray(from: root2, &sorted2)

        var index1: Int = 0
        var index2: Int = 0

        var result: [Int] = []
        while(index1 <= sorted1.count - 1 && index2 <= sorted2.count - 1) {
            let v1 = sorted1[index1]
            let v2 = sorted2[index2]
            if (v1 == v2) {
                result.append(v1)
                index1 += 1

                result.append(v2)
                index2 += 1
            } else if (v1 < v2) {
                result.append(v1)
                index1 += 1
            } else {
                result.append(v2)
                index2 += 1
            }
        }

        while (index1 <= sorted1.count - 1) {
            let v1 = sorted1[index1]
            result.append(v1)
            index1 += 1
        }

        while (index2 <= sorted2.count - 1) {
            let v2 = sorted2[index2]
            result.append(v2)
            index2 += 1
        }

        return result
    }

    private func getSortedArray(from root: TreeNode?, _ result: inout [Int])  {
        guard let root = root else { return }

        getSortedArray(from: root.left, &result)
        result.append(root.val)
        getSortedArray(from: root.right, &result)
    }
}
