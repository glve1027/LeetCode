//
//  LeetCode_67. 二进制求和_89.47%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/15.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aDatas = Array(a)
        var bDatas = Array(b)
        let rest = abs(aDatas.count - bDatas.count)
        if (aDatas.count > bDatas.count) {
            for _ in 0..<rest { bDatas.insert("0", at: 0) }
        } else if (aDatas.count < bDatas.count) {
            for _ in 0..<rest { aDatas.insert("0", at: 0) }
        }
        
        //calculate
        var result: [String] = []
        var willAddValue: Int = 0
        for i in stride(from: aDatas.count - 1, through: 0, by: -1) {
            guard let aValue = Int(String(aDatas[i])), let bValue = Int(String(bDatas[i])) else { continue }
            let value =  aValue + bValue + willAddValue
            guard value >= 0, value <= 3 else { continue }
            if value <= 1 {
                result.insert("\(value)", at: 0)
                willAddValue = 0
            } else {
                willAddValue = 1
                result.insert("\(value - 2)", at: 0)
            }
        }
        if (willAddValue > 0) { result.insert("\(willAddValue)", at: 0) }
        return result.joined(separator: "")
    }
}
