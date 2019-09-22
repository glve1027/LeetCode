//
//  LeetCode_933. 最近的请求次数_90.91%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/22.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class RecentCounter {
    
    var datas: [Int] = []
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        if (self.datas.isEmpty) {
            self.datas.append(t)
            return 1
        } else if t - 3000 <= 1 {
            self.datas.append(t)
            return self.datas.count
        } else {
            let findValue = find(0, self.datas.count - 1, t-3000)
            self.datas.append(t)
            return self.datas.count - findValue
        }
    }
    
   
     // 解法1：在datas中的起点的合适位置（！！但是会报超时，时间复杂度比较高）
    private func find(_ value: Int) -> Int {
        guard !self.datas.isEmpty else { return -1 }
        // 最大
        if let maxValue = self.datas.last, value > maxValue { return self.datas.count }
        // 最小
        if let minValue = self.datas.first, minValue > value { return -1 }
        
        for i in 0..<self.datas.count {
            if (self.datas[i] == value) {
                return i
            } else if (self.datas[i] < value && self.datas.count - 1 >= i + 1 && self.datas[i+1] > value) {
                return i + 1
            }
        }
        return -1
    }
 
    
    // 解法2：二分查找法
    private func find(_ from: Int, _ to: Int, _ value: Int) -> Int {
        var from = from
        var to = to
        while from <= to {
            let mid = (from + to) / 2
            if self.datas[mid] > value {
                to = mid - 1
            } else if self.datas[mid] < value {
                from = mid + 1
            } else {
                return mid
            }
        }
        return max(from, to)
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
