//
//  LeetCode_344. Reverse String_70.30%.swift
//  Coding
//
//  Created by GongHuan on 2020/1/20.
//  Copyright © 2020 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        guard s.count > 1 else { return }
        
        var lIndex = 0
        var rIndex = s.count - 1
        while lIndex < rIndex && lIndex <= s.count - 1 && rIndex >= 0 {
            s.swapAt(lIndex, rIndex)
            
            lIndex += 1
            rIndex -= 1
        }
    }
}
