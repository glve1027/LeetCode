//
//  LeetCode_1078_Bigram 分词_68.75%.swift
//  Coding
//
//  Created by GongHuan on 2019/8/7.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        let datas = text.components(separatedBy: " ")
        guard !datas.isEmpty else { return [] }
        var result: [String] = []
        for i in 0..<datas.count {
            if (String(datas[i]) == first && (i+1) <= datas.count - 1 && String(datas[i+1]) == second && (i+2) <= datas.count - 1) {
                result.append(String(datas[i+2]))
            }
        }
        return result
    }
}
