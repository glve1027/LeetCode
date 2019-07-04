//
//  LeetCode_557_.swift
//  tt
//
//  Created by GongHuan on 2019/7/4.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        let datas = s.components(separatedBy:" ")
        var temp: [String] = []
        _ = datas.map { temp.append(reverseEveryWord($0)) }
        return temp.joined(separator: " ")
    }
    
    private func reverseEveryWord(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var charDatas = Array(s)
        let mid = charDatas.count / 2
        for i in 0..<mid {
            let l = charDatas[i]
            charDatas[i] = charDatas[charDatas.count - 1 - i];
            charDatas[charDatas.count - 1 - i] = l
        }
        return String(charDatas)
    }
}
