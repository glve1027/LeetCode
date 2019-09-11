//
//  LeetCode_461_汉明距离_96.67%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/11.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var dx = convert2Binary(x)
        var dy = convert2Binary(y)
        if (dx.count > dy.count) {
            for _ in 1...(dx.count-dy.count) {
                dy.insert(0, at: 0)
            }
        } else if (dy.count > dx.count) {
            for _ in 1...(dy.count-dx.count) {
                dx.insert(0, at: 0)
            }
        }
        
        var result: Int = 0
        for i in 0..<dy.count {
            if (dx[i] != dy[i]) { result += 1 }
        }
        
        return result
    }
    
    private func convert2Binary(_ x: Int) -> [Int] {
        guard x >= 0 else { return [] }
        if (x == 0 || x == 1) {
            return [x]
        }
        var result: [Int] = []
        var x = x
        while x >= 2 {
            let number = x % 2
            result.insert(number, at: 0)
            x /= 2
        }
        
        if (x != 0) { result.insert(x, at: 0) }
        return result
    }
}
