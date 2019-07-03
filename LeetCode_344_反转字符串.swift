//
//  LeetCode_344_反转字符串.swift
//  GCTNoti
//
//  Created by 龚欢 on 2019/7/3.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        guard s.count > 1 else { return }
        let mid = s.count / 2
        for i in 0..<mid {
            let l = s[i]
            s[i] = s[s.count - 1 - i]
            s[s.count - 1 - i] = l
        }
    }
}
