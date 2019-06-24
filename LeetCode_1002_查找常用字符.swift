//
//  LeetCode_1002_查找常用字符.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/24.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard let indexData = A.first else { return [] }
        var indexArrayData = Array(indexData)
        for i in 1..<A.count {
            let iArray = Array(A[i])
            guard iArray.count > 0 else { continue }
            var tempData: [Character] = []
            for c in iArray {
                if (indexArrayData.contains(c)) {
                    tempData.append(c)
                    indexArrayData = removeFrom(indexArrayData, c)
                }
            }
            indexArrayData = tempData
        }
        return indexArrayData.map { String($0) }
    }
    
    private func removeFrom(_ arr: [Character], _ of: Character) -> [Character] {
        var find: Bool = false
        var res: [Character] = []
        for c in arr {
            if of == c && find == false {
                find = true
                continue
            }
            res.append(c)
        }
        return res
    }
}
