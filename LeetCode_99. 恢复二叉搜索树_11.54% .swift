//
//  LeetCode_99. 恢复二叉搜索树_11.54% .swift
//  Coding
//
//  Created by GH on 2020/6/17.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var temp: [Int] = []
    var replaceMin: Bool = false
    var replaceMax: Bool = false
    
    func recoverTree(_ root: TreeNode?) {
        inOrder(root)
        let datas = find(temp)
        guard datas.count == 2 else { return }
        datas[0] > datas[1] ? replace(root, datas[0], datas[1]) : replace(root, datas[1], datas[0])
    }

    func replace(_ root: TreeNode?, _ max: Int, _ min: Int) {
        guard let root = root else { return }
        if (replaceMin == true && replaceMax == true) { return }

        if (root.val == max) {
            root.val = min
            replaceMax = true
            replace(root.left, max, min)
            replace(root.right, max, min)
        } else if (root.val == min) {
            root.val = max
            replaceMin = true
            replace(root.left, max, min)
            replace(root.right, max, min)
        } else if (root.val > max) {
            replace(root.left, max, min)
        } else if (root.val < min) {
            replace(root.right, max, min)
        } else if let l = root.left, let r = root.right, l.val == max, r.val == min {
            l.val = min
            r.val = max
            replaceMax = true
            replaceMin = true
        } else {
            replace(root.left, max, min)
            replace(root.right, max, min)
        }
    }

    private func find(_ datas: [Int]) -> [Int] {
        guard !datas.isEmpty else { return [] }

        let datas = datas
        let sorted = datas.sorted { $0 < $1 }
        var result: [Int] = []
        for i in 0..<datas.count where datas[i] != sorted[i] {
            result.append(datas[i])
        }
        return result
    }

    private func inOrder(_ root: TreeNode?) {
        guard let root = root else { return }

        inOrder(root.left)
        temp.append(root.val)
        inOrder(root.right)
    }
}
