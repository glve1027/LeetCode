//
//  LeetCode_1047_删除字符串中的所有相邻重复项_50%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/7.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func removeDuplicates(_ S: String) -> String {
        let datas = Array(S)
        guard !datas.isEmpty else { return "" }
        // 这里结题的思路就是用：栈的数据结构去思考问题
        var resultCollect: [Character] = []
        for i in 0..<datas.count {
            let currentChar = datas[i]
            if let last = resultCollect.last, last == currentChar {
                resultCollect.removeLast()
            } else {
                resultCollect.append(currentChar)
            }
        }
        
        if resultCollect.count == datas.count {
            return S
        } else {// 递归调用
            return removeDuplicates(String(resultCollect))
        }
    }
}
