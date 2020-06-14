//
//  LeetCode_559. N叉树的最大深度_46.15%.swift
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

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }

        var temp: [Node] = [root]
        var deep: Int = 1

        while !temp.isEmpty {
            let current = temp.removeFirst()
           
            current.children.forEach {
                deep = max(deep, maxDepth($0) + 1)
            }
        }

        return deep
    }
}
