//
//  LeetCode_728_自除数_26.32%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/16.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var result: [Int] = []
        for i in stride(from: left, through: right, by: 1) {
            if i < 10 || isOK(i) {
                result.append(i)
            }
        }
        
        return result
    }
    
    private func isOK(_ i: Int) -> Bool {
        for a in Array("\(i)") {
            if let bb = Int(String(a)) {
                if (bb == 0 || i % bb != 0) { return false }
            }
        }
        return true
    }
}
