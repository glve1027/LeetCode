//
//  LeetCode_989. 数组形式的整数加法_5%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/15.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var A: [Int] = A
        var kDatas = Array("\(K)")
        let restCount: Int = abs(A.count - kDatas.count)
        if (A.count > kDatas.count) {
            for _ in 0..<restCount { kDatas.insert("0", at: 0) }
        } else if (A.count < kDatas.count) {
            for _ in 0..<restCount { A.insert(0, at: 0) }
        }
        var result: [Int] = []
        var willAdd: Int = 0
        for i in stride(from: A.count - 1, through: 0, by: -1) {
            guard let kvalue = Int(String(kDatas[i])) else {continue}
            let value = kvalue + A[i] + willAdd
            if (value >= 10) {
                willAdd = 1
                result.insert(value - 10, at: 0)
            } else {
                willAdd = 0
                result.insert(value, at: 0)
            }
        }
        if (willAdd > 0) { result.insert(willAdd, at: 0) }
        return result
    }
}
