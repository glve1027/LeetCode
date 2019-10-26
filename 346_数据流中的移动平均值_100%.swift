//
//  346_数据流中的移动平均值_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/26.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class MovingAverage {
    
    /** Initialize your data structure here. */
    var stack: [Int] = [] // Stack
    var size: Int = 0     // Total Sum
    var total: Int = 0
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        stack.append(val)
        total += val
        while stack.count > size {  total -= stack.removeFirst() }
        return stack.count < self.size ? Double(total) / Double(stack.count) : Double(total) / Double(self.size)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
