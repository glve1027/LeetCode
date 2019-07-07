//
//  LeetCode_804_唯一摩尔斯密码词.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/7.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let data = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var res: Set<String> = []
        for w in words {
            var temp: [String] = []
            let wordArray = Array(w)
            for w in wordArray {
                let value = Int(w.unicodeScalars[w.unicodeScalars.startIndex].value) - Int("a".unicodeScalars["a".unicodeScalars.startIndex].value)
                temp.append(data[value])
            }
            res.insert(temp.joined(separator: ""))
        }
        return res.count
    }
}
