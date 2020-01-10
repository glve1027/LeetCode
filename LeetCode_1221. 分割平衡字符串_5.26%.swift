//
//  LeetCode_1221. 分割平衡字符串_5.26%.swift
//  Coding
//
//  Created by GH on 2020/1/11.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }

        let datas = Array(s)

        var result: Int = 0

        find(datas, &result)

        return result
    }

    private func find(_ datas: [Character], _ result: inout Int) {
        guard !datas.isEmpty else { return }

        var rCount: Int = 0
        var lCount: Int = 0
        for i in 0..<datas.count {
            if (String(datas[i]) == "R") {
                rCount += 1
            } else if (String(datas[i]) == "L") {
                lCount += 1
            } else {
                break
            }

            if (rCount == lCount && rCount > 0) {
                result += 1
                if (i+1 <= datas.count - 1) { find(Array(datas[i+1..<datas.count]), &result) }
                break
            }
        }
    }
}
