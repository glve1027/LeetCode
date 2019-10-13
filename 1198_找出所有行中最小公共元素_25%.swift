//
//  1198_找出所有行中最小公共元素_25%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/13.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func smallestCommonElement(_ mat: [[Int]]) -> Int {
        guard mat.count > 1 else { return -1 }
        guard let first = mat.first else { return -1 }
        var firstSet = Set(first)
        for i in 1..<mat.count {
            let mvalue = Set(mat[i]).intersection(firstSet)
            if (mvalue.count == 0) { return -1 }
            firstSet = mvalue
        }
        return firstSet.min() ?? -1
    }
}
