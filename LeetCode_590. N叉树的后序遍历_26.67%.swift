//
//  LeetCode_590. N叉树的后序遍历_26.67%.swift
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
 递归解法
 */
class Solution {
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }

        var temp: [Node] = [root]
        var result: [Int] = []

        while !temp.isEmpty {
            let current = temp.removeFirst()

            current.children.forEach {
                result += postorder($0)
            }

            result.append(current.val)
        }

        return result
    }
}
