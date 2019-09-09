//
//  LeetCode_1021_删除最外层的括号_39.39%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/9.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        let datas: [Character] = Array(S)
        guard !datas.isEmpty else { return "" }
        
        var temp: [Character] = []      // 临时存储
        var result: [Character] = []    // 找到成对数据的时候返回的结果
        var find: [String] = []
        for s in datas {
            if (s == Character("(")) {
                temp.append(s)
            } else if let last = temp.last, last == Character("(") {
                temp.removeLast()
            }
            result.append(s)
            if (temp.isEmpty) {
                find.append(String(result))
                result = []
            }
        }
        
        // 过滤最外成的括号
        var final: [Character] = []
        _ = find.filter { $0.count > 1 }.map { final += Array($0)[1..<$0.count - 1] }
        
        return String(final)
    }
}
