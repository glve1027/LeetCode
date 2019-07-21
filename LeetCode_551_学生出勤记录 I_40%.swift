//
//  LeetCode_551_学生出勤记录 I_40%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/21.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func checkRecord(_ s: String) -> Bool {
        let datas = Array(s)
        var aValue: [Int] = []
        var lValue: [Int] = []
        for i in 0..<datas.count {
            if (datas[i] == Character("A")) {
                aValue.append(i)
            } else if (datas[i] == Character("L")) {
                if lValue.count >= 2 && lValue[lValue.count - 1] == i - 1 && lValue[lValue.count - 2] == i - 2 {
                    return false
                } else {
                    lValue.append(i)
                }
            }
            if (aValue.count >= 2) { return false }
        }
        return true
    }
}
