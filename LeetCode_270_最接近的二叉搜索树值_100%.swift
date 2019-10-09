//
//  LeetCode_270_最接近的二叉搜索树值_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/9.
//  Copyright © 2019 GongHuan. All rights reserved.
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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        converTree2Array(root)
        return binaryFind(target, 0, datas.count - 1)
    }
    
    private func binaryFind(_ targte: Double, _ l: Int, _ r: Int) -> Int {
        guard !datas.isEmpty else { return -1 }
        var l = l
        var r = r
        let tInt = Int(targte)
        while l <= r {
            let mid = (r + l) / 2
            if (datas[mid] > tInt) {
                r = mid - 1
            } else if (datas[mid] < tInt) {
                l = mid + 1
            } else {
                print("b")
                return findBetween(mid, targte)
            }
        }
        return findBetween(r, targte)
    }
    
    private func findBetween(_ index: Int, _ target: Double) -> Int {
        var between: Double? = nil
        var value: Int? = nil
        if (index >= 0 && index <= datas.count - 1) {
            let currentValue = datas[index]
            between = abs(Double(currentValue) - target)
            value = currentValue
        }
        
        if (index - 1 >= 0 && index - 1 <= datas.count - 1) {
            let currentValue = datas[index-1]
            if (between != nil && value != nil && between! < abs(Double(currentValue) - target)){
                
            } else {
                between = abs(Double(currentValue) - target)
                value = currentValue
            }
        }
        
        if (index + 1 >= 0 && index + 1 <= datas.count - 1) {
            let currentValue = datas[index+1]
            if (between != nil && value != nil && between! < abs(Double(currentValue) - target)){
                
            } else {
                between = abs(Double(currentValue) - target)
                value = currentValue
            }
        }
        return value ?? -1
    }
    
    var datas: [Int] = []
    private func converTree2Array(_ root: TreeNode?) {
        guard let root = root else { return }
        converTree2Array(root.left)
        datas.append(root.val)
        converTree2Array(root.right)
    }
}
