//
//  LeetCode_258_各位相加_50%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/17.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func addDigits(_ num: Int) -> Int {
        if num < 10 { return num }
        let datas = Array("\(num)")
        var value = 0
        for n in datas {
            if let v = Int(String(n)) {
                value += v
            }
        }
        return addDigits(value)
    }
}
