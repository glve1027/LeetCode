//
//  LeetCode_844_比较含退格的字符串_50%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/18.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return convert2String(S) == convert2String(T)
    }
    
    private func convert2String(_ string: String) -> String {
        let datas = Array(string)
        var temp: [Character] = []
        _ = datas.map {
            if ($0 == "#") {
                if (!temp.isEmpty) { temp.removeLast() }
            } else {
                temp.append($0)
            }
        }
        return String(temp)
    }
}
