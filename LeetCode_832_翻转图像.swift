//
//  LeetCode_832.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/20.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var res: [[Int]] = []
        for v in A {
            res.append(allFlip(horFlip(v)))
        }
        return res
    }
    
    private func horFlip(_ A: [Int]) -> [Int] {
        var A = A
        let index = A.count % 2 != 0 ? A.count / 2 : A.count / 2 - 1
        guard A.count > 1 else { return A }
        for i in 0...index {
            (A[i], A[A.count-1-i]) = (A[A.count-1-i], A[i])
        }
        return A
    }
    
    private func allFlip(_ A: [Int]) -> [Int] {
        var A = A
        for i in 0..<A.count {
            if (A[i] == 0) {
                A[i] = 1
            } else {
                A[i] = 0
            }
        }
        return A
    }
}
