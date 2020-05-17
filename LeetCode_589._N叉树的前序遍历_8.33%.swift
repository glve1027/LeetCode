//
//  LeetCode_589._N叉树的前序遍历_8.33%.swift
//  Coding
//
//  Created by GH on 2020/5/17.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

/**
 递归方法
 */
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }

        var nodes: [Node] = [root]
        var results: [Int] = []

        while !nodes.isEmpty {
            var current = nodes.removeFirst()

            results.append(current.val)
            current.children.forEach { results += preorder($0) }
        }

        return results
    }
}

/**
 迭代方法
 */
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }

        var temp: [Node] = [root]
        var result: [Int] = []

        while !temp.isEmpty {
            let current = temp.removeFirst()
            result.append(current.val)

            let child = current.children
            if !child.isEmpty {
                temp = child + temp
            }
        }
        return result
    }
}
