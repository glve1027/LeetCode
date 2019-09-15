//
//  LeetCode_9_回文数_42.59%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/15.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let datas = Array("\(x)")
        var find: [Character] = []
        for i in 0..<(datas.count / 2) {
            find.append(datas[i])
        }
        // !! 这里需要注意奇/偶数
        let start = datas.count % 2 == 0 ? datas.count / 2 : datas.count / 2 + 1
        for i in start..<datas.count {
            guard !find.isEmpty else { return false }
            if find.removeLast() != datas[i] { return false }
        }
        return find.isEmpty
    }
}
