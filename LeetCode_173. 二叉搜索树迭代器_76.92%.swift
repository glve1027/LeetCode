//
//  LeetCode_173. 二叉搜索树迭代器_76.92%.swift
//  Coding
//
//  Created by GH on 2020/6/16.
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

class BSTIterator {

    var datas: [Int] = []
    var index: Int = 0
    init(_ root: TreeNode?) {
        convert2Array(root)
    }

    private func convert2Array(_ root: TreeNode?) {
        if let root = root {
            convert2Array(root.left)
            datas.append(root.val)
            convert2Array(root.right)
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        guard hasNext() == true else { return -1 }
        let value = datas[index]
        index += 1
        return value
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return datas.count > index
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
