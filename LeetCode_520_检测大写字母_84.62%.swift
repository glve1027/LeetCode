//
//  LeetCode_520_检测大写字母_84.62%.swift
//  WW
//
//  Created by 龚欢 on 2019/7/27.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        return [word.uppercased(), word.lowercased(), convertFirst(word)].contains(word)
    }
    
    private func convertFirst(_ word: String) -> String {
        var datas = Array(word)
        guard !datas.isEmpty else { return "" }
        guard datas.count > 1 else { return word.uppercased() }
        return String(datas[0]).uppercased() + String(datas[1..<datas.count]).lowercased()
    }
}
