//
//  LeetCode_542_01 矩阵_100%.swift
//  Coding
//
//  Created by GH on 2019/12/29.
//  Copyright © 2019 GH. All rights reserved.
//

import Foundation

class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else { return [] }

        var result: [[Int]] = []
        for i in 0..<matrix.count {
            let datas = matrix[i]

            var temp: [Int] = []
            for j in 0..<datas.count {
                let currentValue = datas[j]
                if (currentValue == 0) {
                    temp.append(0)
                } else {
                    // 找到这个“1”最近的0
                    // 此处的坐标 (i, j)
                    // 这里需要递归查询
                    var steps: Int = 0
                    var points: [[Int]] = [[i, j]]
                    temp.append(findNearZeroWithSteps(matrix, &points, matrix.count, datas.count, &steps))
                }
            }
            result.append(temp)
        }

        return result
    }

    private func findNearZeroWithSteps(_ source: [[Int]], _ points: inout [[Int]], _ xMax: Int, _ yMax: Int, _ currentSetp: inout Int) -> Int {
        guard !points.isEmpty else { return -1 }
        
        // 有可能此次找不到0，需要再次递归调用，所以需要保存数据
        var temp: [[Int]] = []

        for p in points {
            let x = p[0]
            let y = p[1]

             if (x >= xMax || y > yMax) { return -1 }

            let value = source[x][y]

            if value == 0 {
                // 此时已经找到0了，不需要再找了
                return currentSetp
            }

            // 上
            if y - 1 >= 0 && y - 1 < yMax {
                if source[x][y-1] == 0 {
                    return currentSetp + 1
                } else {
                    temp.append([x, y - 1])
                }
            }

            // 下
            if y + 1 >= 0 && y + 1 < yMax {
                if source[x][y+1] == 0 {
                    return currentSetp + 1
                } else {
                    temp.append([x, y + 1])
                }
            }

            // 左
            if x - 1 >= 0 && x - 1 < xMax {
                if source[x-1][y] == 0 {
                    return currentSetp + 1
                } else {
                    temp.append([x-1, y])
                }
            }

            // 右
            if x + 1 >= 0 && x + 1 < xMax {
                if source[x+1][y] == 0 {
                    return currentSetp + 1
                } else {
                    temp.append([x+1, y])
                }
            }
        }

        guard !temp.isEmpty else { return -1 }
        
        var nextStep = currentSetp + 1
        return findNearZeroWithSteps(source, &temp, xMax, yMax, &nextStep)
    }
}
