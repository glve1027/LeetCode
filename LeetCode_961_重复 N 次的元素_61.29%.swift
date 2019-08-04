//
//  LeetCode_961_重复 N 次的元素_61.29%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/4.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        guard !A.isEmpty else { return 0 }
        var temp: [Int: Int] = [:]
        let findCount = A.count / 2
        for n in A {
            if var count = temp[n] {
                count += 1
                if (count == findCount) { return n }
                temp[n] = count
            } else {
                temp[n] = 1
            }
        }
        return 0
    }
}
