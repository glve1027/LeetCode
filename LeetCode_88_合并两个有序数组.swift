//
//  LeetCode_88.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/19.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = (nums1[..<m] + nums2).sorted{ $0 < $1 }
    }
}
