//
//  LeetCode.swift
//  Coding
//
//  Created by GH on 2020/5/10.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var nodes: [TreeNode] = [root]
        var indexMap: [String: Int] = ["\(Unmanaged.passUnretained(root).toOpaque())": 1]
        var levelIndexes: [Int] = []
        var everyLevelCount: Int = 1
        var result: Int = 1

        while (!nodes.isEmpty) {
            let current = nodes.removeFirst()
            everyLevelCount -= 1

            if let l = current.left {
                nodes.append(l)
                if let v = indexMap["\(Unmanaged.passUnretained(current).toOpaque())"] {
                    levelIndexes.append(2 &* v)
                    indexMap["\(Unmanaged.passUnretained(l).toOpaque())"] = 2 &* v
                }
            }

            if let r = current.right {
                nodes.append(r)
                if let v = indexMap["\(Unmanaged.passUnretained(current).toOpaque())"] {
                    levelIndexes.append(2 &* v &+ 1)
                    indexMap["\(Unmanaged.passUnretained(r).toOpaque())"] = 2 &* v &+ 1
                }
            }

            if (everyLevelCount == 0) {
                everyLevelCount = nodes.count
                if (levelIndexes.count > 1) { result = max(result, (levelIndexes.last! &- levelIndexes.first! &+ 1)) }
                levelIndexes = []
            }
            
        }

        return result
    }
}
