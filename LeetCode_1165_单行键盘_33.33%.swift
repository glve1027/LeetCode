//
//  LeetCode_1165_单行键盘_33.33%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/3.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        let dataMap = convert2Map(Array(keyboard))
        var currentIndex: Int = 0
        var result: Int = 0
        
        let wDatas = Array(word)
        for n in wDatas {
            guard let index = dataMap[n] else { continue }
            result += abs(currentIndex - index)
            currentIndex = index
        }
        return result
    }
    
    private func convert2Map(_ from: [Character]) -> [Character: Int] {
        var result: [Character: Int] = [:]
        for i in 0..<from.count {
            result[from[i]] = i
        }
        return result
    }
}
