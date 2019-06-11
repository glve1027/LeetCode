//
//  LeetCode_1022_从根到叶的二进制数之和.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/11.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        let r = helper(root)
        var sum = 0
        for d in r {
            sum += calculate(d)
        }
        return sum
    }
    
    private func helper(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        if root.left == nil && root.right == nil { return [[root.val]]}
        let l = helper(root.left)
        let r = helper(root.right)
        var res: [[Int]] = []
        for var t in l {
            t.insert(root.val, at: 0)
            res.append(t)
        }
        
        for var t in r {
            t.insert(root.val, at: 0)
            res.append(t)
        }
        
        return res
    }
    
    private func calculate(_ data: [Int]) -> Int {
        var result = 0
        for i in 0..<data.count {
            if (data[i] == 0) { continue }
            // 这段代码xcode 没问题，但是leetcode报错！！
            //let a = pow(2, data.count - 1 - i)
            //let decimalToInt = NSDecimalNumber(decimal: a).intValue
            result += cal1(data.count - 1 - i) * data[i]
        }
        return result
    }
    
    private func cal1(_ ci: Int) -> Int {
        var result: Int = 1
        for _ in 0..<ci {
            result *= 2
        }
        return result
    }
}
