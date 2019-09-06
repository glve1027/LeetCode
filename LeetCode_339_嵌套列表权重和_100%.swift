//
//  LeetCode_339_嵌套列表权重和_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/6.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var result: Int = 0
        var deep: Int = 1
        _ = calculate(&result, &deep, nestedList)
        return result
    }
    
    private func calculate(_ result: inout Int, _ deep: inout Int, _ nestedList: [NestedInteger]) -> Int {
        guard !nestedList.isEmpty else { return 0 }
        
        var restNestedList: [NestedInteger] = []
        for nes in nestedList {
            if (nes.isInteger()) {
                result += deep * nes.getInteger()
            } else {
                restNestedList += nes.getList()
            }
        }
        if !restNestedList.isEmpty {  deep += 1 }
        // 递归调用
        return result + calculate(&result, &deep, restNestedList)
    }
}
