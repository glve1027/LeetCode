//
//  LeetCode_203_移除链表元素.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/29.
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var filterDatas: [Int] = []
        var head: ListNode? = head
        while head != nil {
            if (head!.val != val) { filterDatas.append(head!.val) }
            head = head!.next
        }
        
        return createListNode(filterDatas)
    }
    // 根据数组创建ListNode
    private func createListNode(_ by: [Int]) -> ListNode? {
        guard !by.isEmpty else { return nil }
        var tempListNode: ListNode? = nil
        var returnListNode: ListNode? = nil
        _ = by.map {
            if (tempListNode == nil) {
                tempListNode = ListNode($0)
                returnListNode = tempListNode
            } else {
                tempListNode?.next = ListNode($0)
                tempListNode = tempListNode?.next
            }
        }
        return returnListNode
    }
}
