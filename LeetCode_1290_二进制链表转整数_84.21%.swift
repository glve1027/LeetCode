//
//  LeetCode_1290_二进制链表转整数_84.21%.swift
//  Coding
//
//  Created by GH on 2020/1/8.
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
    func getDecimalValue(_ head: ListNode?) -> Int {
        var temp: [Int] = []
        var head = head

        while head != nil {
            temp.insert(head!.val, at:0)

            head = head!.next
        }

        var result: Int = 0
        for i in 0..<temp.count {
            result += Int(pow(Double(2),Double(i))) * temp[i]
        }
        return result
    }
}
