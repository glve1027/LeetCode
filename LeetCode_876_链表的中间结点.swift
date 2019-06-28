//
//  LeetCode_876_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/28.
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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var head: ListNode? = head
        var secondHead: ListNode? = head
        // 求得整个链表的长度
        var headLength: Int = 0
        while head != nil {
            headLength += 1
            head = head!.next
        }
        
        // 再次遍历返回结果
        var res: ListNode? = nil
        var secondIndex: Int = 0
        while secondHead != nil {
            secondIndex += 1
            // 开始
            if (secondIndex == headLength / 2 + 1) { res = secondHead }
            secondHead = secondHead!.next
        }
        return res
    }
}
