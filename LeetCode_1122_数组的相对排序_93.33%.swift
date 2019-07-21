//
//  LeetCode_1122_数组的相对排序_93.33%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/21.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        // 对性能提升比较明显，利用hashMap
        var map2: [Int: Int] = [:]
        for v in arr2 { map2[v] = 1 }
        
        var collect: [Int: Int] = [:]
        var uninclude: [Int] = []
        for v in arr1 {
            if let _ = map2[v] {} else { uninclude.append(v)  }
            
            if var count = collect[v] {
                count += 1
                collect[v] = count
            } else {
                collect[v] = 1
            }
        }
        
        var result: [Int] = []
        for v in arr2 {
            var count = collect[v]!
            while count > 0 {
                result.append(v)
                count -= 1
            }
        }
        
        if !uninclude.isEmpty { uninclude = uninclude.sorted { $0 < $1 } }
        
        return result + uninclude
    }
}
