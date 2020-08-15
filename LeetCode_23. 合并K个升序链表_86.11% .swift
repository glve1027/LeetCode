//
//  LeetCode_23. 合并K个升序链表_86.11% .swift
//  BinaryHeap
//
//  Created by GH on 2020/8/15.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    var sortedNode: [ListNode] = []
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var convert2Int: [Int] = []
        for list in lists where list != nil {
            convert2Int += convert2Array(list)
        }
        return convert2Node(convert2Int.sorted { $0 < $1 })
    }

    private func convert2Array(_ list: ListNode?) -> [Int] {
        var first = list
        var results: [Int] = []
        while first != nil {
            results.append(first!.val)
            first = first!.next
        }
        return results
    }

    private func convert2Node(_ list: [Int]) -> ListNode? {
        guard !list.isEmpty else { return nil }
        var result: ListNode? = nil
        var first: ListNode? = nil

        for v in list {
            if (result == nil) {
                result = ListNode(v)
                first = result
            } else {
                result!.next = ListNode(v)
                result = result!.next
            }
        }

        return first
    }
}
