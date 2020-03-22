//
//  LeetCode_面试题 02.01. 移除重复节点_66.67%.swift
//  Coding
//
//  Created by GH on 2020/3/22.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        // 创建临时变量
        let dummy = ListNode(-1)
        var result = dummy
        var head = head
        var tempCollect: [Int: Int] = [:]
        
        // 迭代
        while (head != nil) {
            // 创建临时变量
            let tempNode = head!
            head = head!.next

            if let _ = tempCollect[tempNode.val] {
                // do nothing
            } else {
                // 保存
                tempCollect[tempNode.val] = 1

                result.next = tempNode
                tempNode.next = nil

                result = result.next!
            }
        }

        return dummy.next
    }
}
