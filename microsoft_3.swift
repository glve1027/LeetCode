//
//  microsoft_3.swift
//  Coding
//
//  Created by GongHuan on 2019/12/5.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation


/**
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }

        var temp: [Character] = []
        let datas: [Character] = Array("\(x)")
        var end = datas.count - 1
        while end >= 0 {
            temp.append(datas[end])
            end -= 1
        }
        return String(temp) == "\(x)"
    }
}

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
/**
 返回与给定的前序和后序遍历匹配的任何二叉树。

 pre 和 post 遍历中的值是不同的正整数。
 */
class Solution {
    var datas: [Int] = []
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        let N = pre.count
        if (N == 0) { return nil }
        var root = TreeNode(pre[0])
        if (N == 1) { return root }

        
        var L = 0
        for i in 0..<post.count where post[i] == pre[1] {
            L = i + 1
        }

        print("====")
        print(pre[1...L])
        print(post[0..<L])
        print("====")
        print(pre[L+1..<N])
        print(post[L..<N-1])
        root.left = constructFromPrePost(Array(pre[1...L]), Array(post[0..<L]))
        root.right = constructFromPrePost(Array(pre[L+1..<N]), Array(post[L..<N-1]))
        //print(L)
        //root.left = constructFromPrePost(Array(pre[1..<L-1]), Array(post[0..<L]))
        //root.right = constructFromPrePost(Array(L+1..<N), Array(post[L..<N-1]))

        return root
    }


}
