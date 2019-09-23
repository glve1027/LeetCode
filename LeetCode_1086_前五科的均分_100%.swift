//
//  LeetCode_1086_前五科的均分_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/23.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        guard !items.isEmpty else { return [] }
        // 这里的count 可以优化，节省内存
        // !!这里的count 不是很准，但是下面的for.in循环可以过滤
        let one: [Int] = []
        var datas = Array(repeating: one, count: items.count/5)
        
        for item in items where item.count == 2 {
            let id = item[0]
            let score = item[1]
            var temps = datas[id-1]
            temps.append(score)
            datas[id-1] = temps
        }
        
        // 排序
        var result: [[Int]] = []
        for i in 0..<datas.count where datas[i].count > 0 {
            let scores = datas[i]
            if scores.count <= 5 {
                result.append([i+1, getAvergae(scores)])
            } else {
                let sorted = scores.sorted { $0 > $1 }
                result.append([i+1, getAvergae(Array(sorted[0..<5]))])
            }
        }
        return result
    }
    
    private func getAvergae(_ datas: [Int]) -> Int {
        var sum = 0
        _ = datas.map { sum += $0 }
        return sum / datas.count
    }
}
