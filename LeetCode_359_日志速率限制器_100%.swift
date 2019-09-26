//
//  LeetCode_359_日志速率限制器_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/26.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation


class Logger {
    
    /** Initialize your data structure here. */
    var map: [String: Int] = [:]
    init() {
        
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let lastTime = map[message] {
            if timestamp - lastTime >= 10 {
                map[message] = timestamp
                return true
            } else {
                return false
            }
        } else {
            map[message] = timestamp
            return true
        }
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
