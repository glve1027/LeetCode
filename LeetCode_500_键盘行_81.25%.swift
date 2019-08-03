//
//  LeetCode_500_键盘行_81.25%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/3.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func findWords(_ words: [String]) -> [String] {
        let data: [String: Int] = ["Q": 1, "W": 1, "E": 1, "R": 1, "T": 1, "Y": 1,"U": 1, "I": 1, "O": 1, "P": 1, "A": 2, "S": 2, "D": 2, "F": 2, "G": 2, "H": 2, "J": 2, "K": 2, "L": 2, "Z": 3, "X": 3, "C": 3, "V": 3, "B": 3, "N": 3, "M": 3]
        
        var result: [String] = []
        for w in words {
            let wDatas = Array(w)
            var last: Int? = nil
            var isSameHang: Bool = true
            for wChar in wDatas {
                if let hang = data[String(wChar).uppercased()] {
                    if let last = last, last != hang {
                        isSameHang = false
                        break
                    } else {
                        last = hang
                    }
                }
            }
            if (isSameHang) { result.append(w) }
        }
        return result
    }
}
