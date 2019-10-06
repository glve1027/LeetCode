//
//  LeetCode_976_三角形的最大周长_85.71%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/6.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        guard A.count >= 3 else { return 0 }
        let sorted = A.sorted { $0 > $1 }
        for i in 0...sorted.count - 3 where canBeTriangle(sorted[i], sorted[i+1], sorted[i+2]){
            return sorted[i] + sorted[i+1] + sorted[i+2]
        }
        return 0
    }
    
    private func canBeTriangle(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        return y+z > x
    }
}
