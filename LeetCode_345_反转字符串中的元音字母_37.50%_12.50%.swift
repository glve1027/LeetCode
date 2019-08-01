//
//  LeetCode_345_反转字符串中的元音字母_12.50%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/1.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

// 37.50%
class Solution {
    func reverseVowels(_ s: String) -> String {
        var datas = Array(s)
        guard !datas.isEmpty else { return "" }
        
        let Ad: [Character] = [Character("a"), Character("e"), Character("i"), Character("o"), Character("u"), Character("A"), Character("E"), Character("I"), Character("O"), Character("U")]
        
        var leftIndex: Int = 0
        var rightIndex: Int = datas.count - 1
        while leftIndex <= rightIndex {
            var leftChar = datas[leftIndex]
            while !Ad.contains(leftChar) && leftIndex <= rightIndex {
                leftIndex += 1
                if (leftIndex >= datas.count) { break }
                leftChar = datas[leftIndex]
            }
            
            
            var rightChar = datas[rightIndex]
            while !Ad.contains(rightChar) && leftIndex <= rightIndex {
                rightIndex -= 1
                rightChar = datas[rightIndex]
            }
            
            if leftIndex > rightIndex { break }
            
            
            if leftChar != rightChar && rightIndex != leftIndex {
                datas.swapAt(rightIndex, leftIndex)
            }
            leftIndex += 1
            rightIndex -= 1
        }
        return String(datas)
    }
}

// 12.50%
class Solution {
    func reverseVowels(_ s: String) -> String {
        let datas = Array(s)
        guard !datas.isEmpty else { return "" }
        
        let Ad: [Character] = [Character("a"), Character("e"), Character("i"), Character("o"), Character("u"), Character("A"), Character("E"), Character("I"), Character("O"), Character("U")]
        var temp: [Character] = []
        for char in datas {
            if Ad.contains(char) {
                temp.append(char)
            }
        }
        
        var finalDatas: [Character] = []
        for char in datas {
            if Ad.contains(char) {
                finalDatas.append(temp.removeLast())
            } else {
                finalDatas.append(char)
            }
        }
        return String(finalDatas)
    }
}
