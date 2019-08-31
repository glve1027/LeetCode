//
//  LeetCode_412_Fizz Buzz_86.49%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/31.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result: [String] = []
        for i in 1...n {
            if (i % 3 == 0 && i % 5 == 0) {
                result.append("FizzBuzz")
            } else if (i % 3 == 0) {
                result.append("Fizz")
            } else if (i % 5 == 0) {
                result.append("Buzz")
            } else {
                result.append("\(i)")
            }
        }
        return result
    }
}
