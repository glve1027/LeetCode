//
//  LeetCode_109_.swift
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
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var head: ListNode? = head
        var temp: [Int] = []
        while head != nil {
            temp.append(head!.val)
            head = head!.next
        }
        
        // 将数组转化为二叉搜索树
        return convertArrayData2BST(temp, 0, temp.count - 1)
    }
    
    // 二分法
    private func convertArrayData2BST(_ by: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard !by.isEmpty else { return nil }
        guard start >= 0, start <= end else { return nil }
        let mid = start + (end - start) / 2
        var root: TreeNode = TreeNode(by[mid])
        root.left = convertArrayData2BST(by, start, mid - 1)
        root.right = convertArrayData2BST(by, mid + 1, end)
        return root
    }
}
