//
//  LeetCode_234_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/27.
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 判断节点是否为空
        guard head != nil else { return true }
        
        var head: ListNode? = head
        var secondHead: ListNode? = head
        
        // 计算ListNode的长度，时间复杂度O(N)
        var count: Int = 0
        while head != nil {
            count += 1
            head = head!.next
        }
        
        // 当节点长度为1的时候为false
        guard count > 1 else { return true }
        
        // 当为偶数时候
        var addEnd: Int = 0
        var startToPop: Int = 0
        if (count % 2 == 0) {
            addEnd = count / 2
            startToPop = addEnd + 1
        } else {// 当为奇数的时候
            addEnd = count / 2
            startToPop = addEnd + 2
        }
        // 计算是否为回文ListNode,时间复杂度O(N), 这里利用Stack的数据结构来做处理
        var temp: [Int] = []
        var index: Int = 0
        while secondHead != nil {
            index += 1
            if (index <= addEnd) {
                temp.append(secondHead!.val)
            }
            if (index >= startToPop) {
                guard !temp.isEmpty else { return false }
                guard let last = temp.popLast(), last == secondHead!.val else { return false }
            }
            secondHead = secondHead!.next
        }
        return temp.isEmpty
    }
}
