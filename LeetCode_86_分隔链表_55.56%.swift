//
//  LeetCode_86_分隔链表_55.56%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/22.
//  Copyright © 2019 Gonghuan. All rights reserved.
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head = head
        
        var small: [Int] = []
        var big: [Int] = []
        while head != nil {
            if (head!.val < x) {
                small.append(head!.val)
            } else {
                big.append(head!.val)
            }
            head = head!.next
        }
        
        return convert2List(small + big)
    }
    
    private func convert2List(_ from: [Int]) -> ListNode? {
        guard !from.isEmpty else { return nil }
        var result: ListNode? = nil
        var first: ListNode? = nil
        for v in from {
            if (result == nil) {
                result = ListNode(v)
            } else {
                // 这里需要理解清楚
                result!.next = ListNode(v)
                result = result!.next
            }
            // 记录下开始的第一个点位置
            if (first == nil) {
                first = result
            }
        }
        return first
    }
}
