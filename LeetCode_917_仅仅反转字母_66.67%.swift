//
//  LeetCode_917_仅仅反转字母_66.67%.swift
//  WW
//
//  Created by 龚欢 on 2019/7/29.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        let datas = Array(S)
        guard !datas.isEmpty else { return S }
        var alpha: [Character] = []
        var noAlpha: [Character] = []
        var finalDatas: [Character] = []
        for c in datas {
            if isAlpha(c) {
                alpha.insert(c, at: 0)
            } else {
                noAlpha.append(c)
            }
        }
        for c in datas {
            if isAlpha(c) {
                finalDatas.append(alpha.removeFirst())
            } else {
                finalDatas.append(noAlpha.removeFirst())
            }
        }
        return String(finalDatas)
    }
    
    private func isAlpha(_ by: Character) -> Bool {
        guard let aValue = by.asciiValue else { return false }
        if ((aValue >= 97 && aValue <= 122) || (aValue >= 65 && aValue <= 90)) { return true }
        return false
    }
}
