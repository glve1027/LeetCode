//
//  LeetCode_1119_删去字符串中的元音_50%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/4.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func removeVowels(_ S: String) -> String {
        return String(Array(S).filter { check(String($0)) })
    }
    
    private func check(_ s: String) -> Bool {
        return s != "a" && s != "e" && s != "i" && s != "o" && s != "u"
    }
}
