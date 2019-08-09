//
//  LeetCode_748_最短完整词_83.33%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/9.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var lMap: [Character: Int] = [:]
        for l in Array(licensePlate) {
            if l == " " { continue }
            if let _ = Int(String(l)) { continue }
            let l = Character(String(l).lowercased())
            if var count = lMap[l] {
                count += 1
                lMap[l] = count
            } else {
                lMap[l] = 1
            }
        }
        
        var result: String? = nil
        for w in words where isInclude(w, lMap) == true {
            if (result == nil || result!.count > w.count) {
                result = w
            }
        }
        return result ?? ""
    }
    
    private func isInclude(_ w: String, _ map: [Character: Int]) -> Bool {
        var map = map
        for cha in Array(w) {
            if var count = map[cha] {
                count -= 1
                if (count == 0) {
                    map.removeValue(forKey: cha)
                } else {
                    map[cha] = count
                }
            }
        }
        return map.isEmpty
    }
}
