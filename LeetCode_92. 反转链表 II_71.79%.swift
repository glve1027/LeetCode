//
//  LeetCode_92. 反转链表 II_71.79%.swift
//  Coding
//
//  Created by GH on 2020/1/26.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

// 方法一
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

// 方法二
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
        var index: Int = 1
        let firstNode: ListNode = ListNode(-1)
        var tempFirstNode: ListNode? = firstNode

        var secondFirstNode: ListNode? = nil
        var secondNode: ListNode? = nil

        let lastNode: ListNode = ListNode(-1)
        var tempLastNode: ListNode? = lastNode

        var head = head

        while head != nil {
            if (index < m) {
                tempFirstNode!.next = ListNode(head!.val)
                tempFirstNode = tempFirstNode!.next
            } else if (index >= m && index <= n) {
                if (secondNode == nil) {
                    secondNode = ListNode(head!.val)
                    secondFirstNode = secondNode
                } else {
                    let temp = ListNode(head!.val)
                    temp.next = secondNode

                    secondNode = temp
                }
            } else {
                tempLastNode!.next = ListNode(head!.val)
                tempLastNode = tempLastNode!.next
            }

            head = head!.next
            index += 1
        }

        // 链接
        secondFirstNode?.next = lastNode.next
        tempFirstNode!.next = secondNode

        return firstNode.next
    }
}
