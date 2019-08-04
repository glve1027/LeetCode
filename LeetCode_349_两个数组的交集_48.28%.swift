//
//  LeetCode_349_两个数组的交集_48.28%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/4.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(Set(nums2)))
    }
}
