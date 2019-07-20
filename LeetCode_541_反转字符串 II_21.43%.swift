//
//  LeetCode_541_反转字符串 II_21.43%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/20.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        let data = Array(s)
        var result: [Character] = []
        for i in stride(from: 0, to: data.count, by: 2 * k) {
            var index = i + 2 * k
            if index >= data.count { index = data.count }
            result += reOrder(Array(data[i..<index]), k)
        }
        return String(result)
    }
    
    private func reOrder(_ d: [Character], _ k: Int) -> [Character] {
        guard !d.isEmpty else { return [] }
        var result: [Character] = []
        if d.count <= k {
            for i in stride(from: d.count - 1, through: 0, by: -1) {
                result.append(d[i])
            }
        } else {
            for i in stride(from: k-1, through: 0, by: -1) {
                result.append(d[i])
            }
            for i in k..<d.count {
                result.append(d[i])
            }
        }
        return result
    }
}
