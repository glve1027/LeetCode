//
//  LeetCode_451_根据字符出现频率排序_60%.swift
//  InfiniteScrollView
//
//  Created by Gonghuan on 2019/10/25.
//  Copyright © 2019 aybek can kaya. All rights reserved.
//

import Foundation

class Solution {
    func frequencySort(_ s: String) -> String {
        let datas = Array(s)
        var map: [Character: Int] = [:]
        _ = datas.map {
            if var count = map[$0] {
                count += 1
                map[$0] = count
            } else {
                map[$0] = 1
            }
        }
        let sorted = map.sorted { $0.value > $1.value }
        var result: [Character] = []
        for (k, v) in sorted {
            for _ in 0..<v {
                result.append(k)
            }
        }
        return String(result)
    }
}
