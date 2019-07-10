//
//  LeetCode_389_找不同.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let tData = convert2Dic(Array(t))
        var sData = convert2Dic(Array(s))
        for (k, v) in tData {
            if let sv = sData[k] {
                if sv != v {
                    return k
                }
            } else {
                return k
            }
        }
        return Character(".")
    }
    
    private func convert2Dic(_ datas: [Character]) -> [Character: Int] {
        var temp: [Character: Int] = [:]
        for v in datas {
            if var count = temp[v] {
                count += 1
                temp[v] = count
            } else {
                temp[v] = 1
            }
        }
        return temp
    }
}
