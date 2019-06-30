//
//  LeetCode_148_排序链表.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/30.
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
    func sortList(_ head: ListNode?) -> ListNode? {
        var head: ListNode? = head
        var collect: [Int] = []
        while head != nil {
            collect.append(head!.val)
            head = head!.next
        }
        return convertArry2ListNode(collect.sorted { $0 < $1 })
    }
    
    private func convertArry2ListNode(_ by: [Int]) -> ListNode? {
        guard !by.isEmpty else { return nil }
        var temp: ListNode? = nil
        var result: ListNode? = nil
        _ = by.map {
            if (temp == nil) {
                temp = ListNode($0)
                result = temp
            } else {
                temp?.next = ListNode($0)
                temp = temp?.next
            }
        }
        return result
    }
}
