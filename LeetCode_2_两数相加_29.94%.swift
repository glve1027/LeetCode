//
//  LeetCode_2_两数相加_29.94%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/19.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (isAllZero(l1)) {
            return l2
        } else if (isAllZero(l2)) {
            return l1
        }
        
        var data1: [Int] = convert2Array(l1)
        var data2: [Int] = convert2Array(l2)
        let count = abs(data1.count - data2.count)
        if (data1.count > data2.count) {
            for _ in 0..<count { data2.append(0) }
        } else if (data2.count > data1.count) {
            for _ in 0..<count { data1.append(0) }
        }
        
        var willAdd: Int = 0
        var result: [Int] = []
        for i in 0..<data1.count {
            let value = willAdd + data1[i] + data2[i]
            if (value >= 10) {
                willAdd = 1
                result.insert(value - 10, at: 0)
            } else {
                willAdd = 0
                result.insert(value, at: 0)
            }
        }
        if willAdd > 0 {
            result.insert(willAdd, at: 0)
        }
        return convert2ListNode(result)
    }
    
    private func isAllZero(_ l: ListNode?) -> Bool {
        var l: ListNode? = l
        while l != nil {
            if (l!.val != 0) { return false }
            l = l!.next
        }
        return true
    }
    
    private func convert2Array(_ l: ListNode?) -> [Int] {
        var l: ListNode? = l
        var temp: [Int] = []
        while l != nil {
            temp.append(l!.val)
            l = l!.next
        }
        return temp
    }
    
    private func convert2ListNode(_ data: [Int]) -> ListNode? {
        var result: ListNode? = nil
        var first: ListNode? = nil
        for i in stride(from: data.count - 1, through: 0, by: -1) {
            if result == nil {
                result = ListNode(data[i])
                first = result
            } else {
                result!.next = ListNode(data[i])
                result = result!.next
            }
        }
        return first
    }
}
