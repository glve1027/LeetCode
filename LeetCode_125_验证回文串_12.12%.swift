//
//  LeetCode_125_验证回文串_12.12%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/17.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let datas = Array(s).filter {
            //a-z：97-122
            //A-Z：65-90
            //0-9：48-57
            let v = Int($0.asciiValue!)
            return ((v >= 97 && v <= 122) || (v >= 65 && v <= 90) || (v >= 48 && v <= 57))
        }
        guard !datas.isEmpty else { return true }
        var l = 0
        var r = datas.count - 1
        while l < r && l <= datas.count - 1 && r >= 0 {
            let lString = String(datas[l]).lowercased()
            let rString = String(datas[r]).lowercased()
            if (lString != rString) { return false }
            
            l += 1
            r -= 1
        }
        return true
    }
}
