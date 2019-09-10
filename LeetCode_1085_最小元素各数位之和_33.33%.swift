//
//  LeetCode_1085_最小元素各数位之和_33.33%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func sumOfDigits(_ A: [Int]) -> Int {
        guard !A.isEmpty else {return 0 }
        let find = A.sorted { $0 < $1 }
        guard let first = find.first else { return 0 }
        var result: Int = 0
        for n in Array("\(first)") { if let value = Int(String(n)) { result += value } }
        return result % 2 == 0 ? 1 : 0
    }
}
