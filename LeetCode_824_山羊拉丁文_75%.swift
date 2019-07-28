//
//  LeetCode_824_山羊拉丁文.swift
//  WW
//
//  Created by 龚欢 on 2019/7/28.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func toGoatLatin(_ S: String) -> String {
        let datas = S.components(separatedBy: " ")
        var result: [String] = []
        for i in 0..<datas.count {
            result.append(String(rule(Array(datas[i]), i + 1)))
        }
        return result.joined(separator: " ")
    }
    
    private func rule(_ datas: [Character], _ i: Int) -> [Character] {
        var datas = datas
        guard !datas.isEmpty else { return datas }
        let firstChar = datas.first!
        let yuan: [Character: Int] = [Character("a"): 1, Character("e"):1, Character("i"):1, Character("o"): 1, Character("u"): 1, Character("A"): 1, Character("E"): 1, Character("I"): 1, Character("O"): 1, Character("U"): 1];
        if let _ = yuan[firstChar] {
            datas.append(Character("m"))
            datas.append(Character("a"))
        } else {
            let f = datas.removeFirst()
            datas.append(f)
            datas.append(Character("m"))
            datas.append(Character("a"))
        }
        
        for _ in 0..<i { datas.append(Character("a")) }
        return datas
    }
}
