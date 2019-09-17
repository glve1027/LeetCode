//
//  LeetCode_252_会议室_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/17.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard !intervals.isEmpty else { return true }
        var map: [Int: [Int]] = [:] // key: 开始时间  value: 开始-结束时间
        for i in intervals {
            guard i.count == 2 else { continue }
            let startTime = i[0]
            if let _ = map[startTime] {
                return false
            } else {
                map[startTime] = i
            }
        }
        
        let sorted = map.sorted { $0.key < $1.key }
        var result: [Int] = []
        for (_, value) in sorted {
            guard value.count == 2 else { continue }
            
            if !result.isEmpty {
                let start = value[0]
                if let last = result.last, last > start {
                    return false
                }
            }
            result += value
        }
        return true
    }
}
