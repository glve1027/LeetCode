//
//  LeetCode_953_验证外星语词典_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/5.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard !words.isEmpty else { return false }
        var map: [Character: Int] = [:]
        
        let datas = Array(order)
        for i in 0..<datas.count { map[datas[i]] = i }
        
        return isOrder(words, map, 0)
    }
    
    private func isOrder(_ words: [String], _ map: [Character: Int], _ fromIndex: Int) -> Bool {
        guard !words.isEmpty, !map.isEmpty else { return false }
        
        var temp: [String] = []
        var lastIndex: Int? = nil
        var lastChar: String? = nil
        var fromIndex = fromIndex
        for w in words {
            let charDatas = Array(w)
            if (charDatas.count - 1 < fromIndex) {
                if lastIndex != nil && lastIndex != Int.min {
                    return false
                } else {
                    lastIndex = Int.min
                    continue
                }
            }
            guard let currentCharIndex = map[charDatas[fromIndex]] else { return false }
            if lastIndex != nil && lastIndex! > currentCharIndex { return false }
            if lastIndex != nil && lastIndex! == currentCharIndex {
                temp.append(lastChar!)
                temp.append(String(w))
            }
            lastIndex = currentCharIndex
            lastChar  = String(w)
        }
        if (temp.isEmpty) { return true }
        fromIndex += 1
        return isOrder(temp, map, fromIndex)
    }
}
