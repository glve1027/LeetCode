//
//  LeetCode_771_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/18.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jDatas = Array(J)
        let sDatas = Array(S)
        var count = 0
        for i in sDatas {
            if jDatas.contains(i) { count += 1 }
        }
        return count
    }
}
