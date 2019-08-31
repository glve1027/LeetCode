//
//  LeetCode_1103_分糖果 II_27.78%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/31.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        // 如果顺序分发
        var temp: [Int] = []
        var candies: Int = candies
        
        var count = 1
        var index: Int = 0
        while candies > 0 {
            add(num_people, count, &index, &temp)
            candies -= count // 糖还剩的个数
            
            if (candies - count - 1 > 0) {
                count += 1
            } else {
                add(num_people, candies, &index, &temp)
                candies = 0
            }
        }
        
        // 如果不满就用0来填满
        if (temp.count != num_people) {
            for _ in 0..<num_people-temp.count {
                temp.append(0)
            }
        }
        return temp
    }
    
    // 插入数据
    private func add(_ num_people: Int, _ count: Int, _ index: inout Int, _ result: inout [Int]) {
        if (result.count < num_people) {
            result.append(count)
        } else {
            let i = index % num_people
            result[i] += count
        }
        
        index += 1
    }
}
