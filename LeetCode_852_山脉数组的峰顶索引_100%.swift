//
//  LeetCode_852_山脉数组的峰顶索引_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/21.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        for i in 0..<A.count where i+1 < A.count - 1 && i+2 <= A.count - 1 && A[i] < A[i+1] && A[i+1] > A[i+2] { return i+1 }
        return -1
    }
}
