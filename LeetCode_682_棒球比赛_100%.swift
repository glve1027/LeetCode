//
//  LeetCode_682_棒球比赛_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/27.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func calPoints(_ ops: [String]) -> Int {
        guard !ops.isEmpty else { return 0 }
        var temp: [Int] = []
        for ch in ops {
            if let value = Int(ch) {
                temp.append(value)
            } else if ch == "+" {
                if (temp.count < 2) {
                    continue
                } else {
                    let lastValue = temp.last!
                    let otherValue = temp[temp.count - 2]
                    temp.append(lastValue+otherValue)
                }
            } else if ch == "D" {
                if temp.isEmpty {
                    continue
                } else {
                    if let last = temp.last {
                        temp.append(last*2)
                    }
                }
            } else if ch == "C" {
                if temp.isEmpty {
                    continue
                } else {
                    temp.removeLast()
                }
            }
        }
        return temp.reduce(0) { $0 + $1 }
    }
}
