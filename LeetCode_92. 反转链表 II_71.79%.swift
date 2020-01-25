//
//  LeetCode_92. 反转链表 II_71.79%.swift
//  Coding
//
//  Created by GH on 2020/1/26.
//  Copyright © 2020 GH. All rights reserved.
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var head = head
        var index: Int = 1
        var first: [Int] = []
        var second: [Int] = []
        var third: [Int] = []

        while head != nil {
            let v = head!.val
            if index < m {
                first.append(v)
            } else if (index >= m && index <= n) {
                second.insert(v, at: 0)
            } else {
                third.append(v)
            }

            index += 1
            head = head!.next
        }

        let arr = first + second + third
        var result: ListNode? = nil
        var temp: ListNode? = nil
        for a in arr {
            if result == nil {
                result = ListNode(a)
                temp = result
            } else {
                temp!.next = ListNode(a)
                temp = temp!.next
            }
        }

        return result
    }
}
