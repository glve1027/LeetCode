//
//  LeetCode_28_实现 strStr()_23.30%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/16.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if (needle == "" || needle == haystack) { return 0 }
        let hDatas = Array(haystack)
        let nDatas = Array(needle)
        guard !hDatas.isEmpty, !nDatas.isEmpty else { return -1 }
        guard let firstChar = nDatas.first else { return -1 }
        guard hDatas.contains(firstChar) else { return -1 }
        var i = 0
        while i <= hDatas.count - 1 {
            guard i + nDatas.count - 1 <= hDatas.count - 1 else { return -1 }
            if (String(hDatas[i..<i+nDatas.count]) == needle) { return i }
            i += 1
        }
        return -1
    }
}
