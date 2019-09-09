//
//  LeetCode_1134_阿姆斯特朗数_75%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/9.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func isArmstrong(_ N: Int) -> Bool {
        let datas = Array("\(N)")
        guard !datas.isEmpty else { return false }
        var result: Int = 0
        _ = datas.map {
            if let n = Int(String($0)) {
                result += Int(pow(Double(n), Double(datas.count)))
            }
        }
        return result == N
    }
}
