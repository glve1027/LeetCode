//
//  LeetCode_206_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/26.
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head: ListNode? = head
        var result: ListNode? = nil
        while head != nil {
            if result == nil {
                result = ListNode(head!.val)
            } else {
                var tempNode: ListNode = ListNode(head!.val)
                tempNode.next = result
                result = tempNode
            }
            head = head?.next
            
        }
        return result
    }
}
