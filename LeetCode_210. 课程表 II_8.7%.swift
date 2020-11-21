//
//  LeetCode_210. 课程表 II_8.7%.swift
//  Coding
//
//  Created by GH on 2020/11/21.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // 1. 定义返回的结果
        var result: [Int] = []
        guard !prerequisites.isEmpty else {
            for i in 0..<numCourses {
                result.insert(i, at: 0)
            }
            return result
        }
        // 2. 定义一个队列，先进先出，用于循环
        var queue: [Int] = []
        // 3. 定义个Hash: (课程1): (课程2) 【课程1 依赖 课程2】
        var hashMap: [Int: Set<Int>] = [:]
        // 4. 初始化数据
        var total: Set<Int> = [] // 用于记录所有的节点数目
        var zero: Set<Int> = [] // 用于记录入度为0的数据
        for req in prerequisites where req.count == 2 {
            // course2 ---> course1
            let course1: Int = req[0]
            let course2: Int = req[1]

            if var sets = hashMap[course1] {
                sets.insert(course2)
                hashMap[course1] = sets
            } else {
                hashMap[course1] = [course2]
            }

            if (zero.contains(course1)) { zero.remove(course1) }
            if (hashMap[course2] == nil) { zero.insert(course2) }
            // 异常处理
            total.insert(course1)
            total.insert(course2)
        }

        guard !zero.isEmpty else { return [] }
        queue = Array(zero)

        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current)

            var willReplaceHashMap: [Int: Set<Int>] = [:]
            for (k, var v) in hashMap {
                if (v.contains(current)) { v.remove(current) }
                if (!v.isEmpty) {
                    willReplaceHashMap[k] = v
                } else {
                    queue.append(k)
                }
            }
            hashMap = willReplaceHashMap
        }

        // 存在环
        guard hashMap.isEmpty else { return [] }

        if (result.count != numCourses) {
            for i in 0..<numCourses {
                if (!total.contains(i)) {
                    result.insert(i, at: 0)
                    if (result.count == numCourses) { break }
                }
            }
        }
        return result
    }
}
