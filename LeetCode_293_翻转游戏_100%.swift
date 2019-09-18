//
//  LeetCode_293_翻转游戏_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/18.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func generatePossibleNextMoves(_ s: String) -> [String] {
        let datas = Array(s)
        guard !datas.isEmpty else { return [] }
        var result: [Int] = []
        for i in 0..<datas.count-1 where String(datas[i...i+1]) == "++" {
            result.append(i)
        }
        var finalDatas: [String] = []
        for index in result {
            var datas = datas
            datas[index...index+1] = [Character("-"), Character("-")]
            finalDatas.append(String(datas))
        }
        return finalDatas
    }
}
