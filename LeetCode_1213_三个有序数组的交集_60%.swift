//
//  LeetCode_1213_三个有序数组的交集_60%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/19.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        return Array(Set(arr1).intersection(Set(arr2)).intersection(Set(arr3))).sorted { $0 < $1 }
    }
}
