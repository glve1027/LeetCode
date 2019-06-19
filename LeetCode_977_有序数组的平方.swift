//
//  LeetCode_977_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/19.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map { $0 * $0 }.sorted { $0 < $1 }
    }
}
