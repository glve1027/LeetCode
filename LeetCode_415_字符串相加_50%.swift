//
//  LeetCode_415_字符串相加_50%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/18.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var data1: [Character] = Array(num1)
        var data2: [Character] = Array(num2)
        let count = abs(data1.count - data2.count)
        if (data1.count > data2.count) {
            for _ in 0..<count { data2.insert(Character("0"), at: 0) }
        } else if (data2.count > data1.count) {
            for _ in 0..<count { data1.insert(Character("0"), at: 0) }
        }
        
        var result: [String] = []
        var willAdd: Int = 0
        for i in stride(from: data1.count - 1, through: 0, by: -1) {
            let value = Int(String(data1[i]))! + Int(String(data2[i]))! + willAdd
            if (value >= 10) {
                result.insert("\(value - 10)", at: 0)
                willAdd = 1
            } else {
                result.insert("\(value)", at: 0)
                willAdd = 0
            }
        }
        if (willAdd != 0) { result.insert("\(willAdd)", at: 0) }
        return result.joined(separator: "")
    }
}
