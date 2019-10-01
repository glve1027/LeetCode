//
//  LeetCode_1160_拼写单词_83.33%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/1.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        let datas = Array(chars)
        guard !datas.isEmpty, !words.isEmpty else { return 0 }
        var map: [String: Int] = [:]
        _ = datas.map {
            if var count = map[String($0)] {
                count += 1
                map[String($0)] = count
            } else {
                map[String($0)] = 1
            }
        }
        
        var result: Int = 0
        for w in words where helper(w, map) == true {
            result += w.count
        }
        return result
    }
    
    private func helper(_ w: String, _ m: [String: Int]) -> Bool {
        let wdatas = Array(w)
        guard !wdatas.isEmpty, !m.isEmpty else { return false }
        var m = m
        for d in wdatas {
            if var count = m[String(d)] {
                count -= 1
                if (count == 0) {
                    m.removeValue(forKey: String(d))
                } else {
                    m[String(d)] = count
                }
            } else {
                return false
            }
        }
        return true
    }
}
