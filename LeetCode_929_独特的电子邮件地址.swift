//
//  LeetCode_929_独特的电子邮件地址.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/6.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var res: Set<String> = []
        for e in emails {
            if (e.contains("@")) {
                let data = e.components(separatedBy: "@")
                guard data.count == 2 else { continue }
                var temp: [String] =  []
                temp.append(ruleTwo(ruleOne(data[0])))
                temp.append(data[1])
                res.insert(temp.joined(separator: "@"))
            }
        }
        return res.count
    }
    
    // +
    private func ruleOne(_ s: String) -> String {
        let data = Array(s)
        guard !data.isEmpty else { return "" }
        var temp: [String.Element] = []
        for i in data {
            if (String(i) == "+") { break }
            temp.append(i)
        }
        return String(temp)
    }
    
    // .
    private func ruleTwo(_ s: String) -> String {
        return  s.contains(".") ? s.replacingOccurrences(of: ".", with: "") : s
    }
}
