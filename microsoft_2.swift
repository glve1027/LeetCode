//
//  microsoft_2.swift
//  Coding
//
//  Created by GongHuan on 2019/12/5.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

/*
 给定两个没有重复元素的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。找到 nums1 中每个元素在 nums2 中的下一个比其大的值。
 nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出-1。
 */

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard !nums1.isEmpty, !nums2.isEmpty else { return [] }
        let map = convert2Map(nums2)
        var result: [Int] = []
        for n in nums1 {
            if let index = map[n] {
                result.append(findNextMax(index, nums2))
            }
        }
        return result
    }


    func findNextMax(_ index: Int, _ from: [Int]) -> Int {
        guard !from.isEmpty else { return -1 }
        guard index >= 0, index <= from.count - 1 else { return -1 }
        let currentValue = from[index]
        
        var next = index + 1
        while next <= from.count - 1 {
            let v = from[next]
            if (v > currentValue) {
                return v
            } else {
                next += 1
            }
        }
        return -1
    }

    func convert2Map(_ from: [Int]) -> [Int: Int] {
        guard !from.isEmpty else { return [:] }
        var temp: [Int: Int] = [:]
        for i in 0..<from.count {
            temp[from[i]] = i
        }
        return temp
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
 给定一个二叉搜索树和一个目标结果，如果 BST 中存在两个元素且它们的和等于给定的目标结果，则返回 true。
 */
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var datas: [Int] = []
        helper(root, &datas)
        
        var start = 0
        var end = datas.count - 1
        print(datas)
        while start < end {
            let v = datas[start] + datas[end]
            if (v == k) {
                return true
            } else if (v > k) {
                end -= 1
            } else {
                start += 1
            }
        }

        return false
    }

    private func helper(_ root: TreeNode?, _ data: inout [Int]) {
        guard let root = root else { return }
        helper(root.left, &data)
        data.append(root.val)
        helper(root.right, &data)
    }
}

/***
 给定一个形如 “HH:MM” 表示的时刻，利用当前出现过的数字构造下一个距离当前时间最近的时刻。每个出现数字都可以被无限次使用。

 你可以认为给定的字符串一定是合法的。例如，“01:34” 和 “12:09” 是合法的，“1:34” 和 “12:9” 是不合法的。
 */
class Solution {
    func nextClosestTime(_ time: String) -> String {
        guard !time.isEmpty else { return "" }
        var datas: [Int] = []
        _ = time.components(separatedBy: ":").map {
            if let v = Int(String($0)) {
                datas.append(v)
            }
        }
        guard datas.count == 2 else { return "" }
        var stand: Set<Int> = []
        _ = Array(time).map {
            if let v = Int(String($0)) {
                stand.insert(v)
            }
        }
        find(&datas, stand)
        var v: [String] = []
        _ = datas.map {
            if ($0 >= 0 && $0 <= 9) {
                v.append("0\($0)")
            } else {
                v.append("\($0)")
            }
        }
        return v.joined(separator:":")
    }

    private func find(_ datas: inout [Int], _ stand: Set<Int>) {
        repeat {
            var f = datas[0]
            var l = datas[1]
            l += 1
           if (l >= 60) {
               l -= 60
               f += 1
           }
           if (f >= 24) {
               f -= 24
           }
           datas[0] = f
           datas[1] = l
        } while (!isInclude(&datas, stand))
    }

    private func isInclude(_ datas: inout [Int], _ stand: Set<Int>) -> Bool {
        for d in datas {
            let v = (d >= 0 && d <= 9) ? Array("0\(d)") : Array("\(d)")
            for d1 in v {
                if let iv = Int(String(d1)), !stand.contains(iv) {
                    return false
                }
            }
        }
        return true
    }

}
