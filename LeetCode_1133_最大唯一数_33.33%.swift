//
//  LeetCode_1133_最大唯一数_33.33%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/13.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func largestUniqueNumber(_ A: [Int]) -> Int {
        guard !A.isEmpty else { return -1 }
        var result: [Int: Int] = [:]
        for n in A {
            if var count = result[n] {
                count += 1
                result[n] = count
            } else {
                result[n] = 1
            }
        }
        let find = result.filter { $0.value == 1 }.sorted { $0.key > $1.key }.first
        if let r = find { return r.key }
        return -1
    }
}
