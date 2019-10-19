//
//  LeetCode_925_长按键入_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/19.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        if (name == typed) { return true }
        let nDatas = convert2Map(name)
        let tDatas = convert2Map(typed)
        guard nDatas.count == tDatas.count else { return false }
        for i in 0..<nDatas.count {
            let nMap = nDatas[i]
            let tMap = tDatas[i]
            guard let nk = nMap.keys.first, let tk = tMap.keys.first, nk == tk else { return false }
            guard let nv = nMap.values.first, let tv = tMap.values.first, tv >= nv else { return false }
        }
        return true
    }
    
    private func convert2Map(_ types: String) -> [[Character: Int]] {
        var datas: [[Character: Int]] = []
        _ = Array(types).map {
            if var map = datas.last, var count = map[$0] {
                count += 1
                map[$0] = count
                datas[datas.count - 1] = map
            } else {
                datas.append([$0: 1])
            }
        }
        return datas
    }
}
