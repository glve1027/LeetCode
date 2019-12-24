//
//  LeetCode_994_腐烂的橘子_50%.swift
//  Coding
//
//  Created by GongHuan on 2019/12/24.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }

        var bads: [[Int]] = []
        var visited: [[Int]] = []
        var grid = grid
        var total: Int = 0
        var maxY: Int = 0
        let maxX: Int = grid.count - 1
        
        for i in 0..<grid.count {
            let temp = grid[i]
            maxY = max(maxY, temp.count - 1)
            for j in 0..<temp.count {
                if (temp[j] == 2) {
                    bads.append([i, j])
                    visited.append([i, j])
                }
                total += 1
            }
        }

        // 起始条件判断
        if (bads.isEmpty) { return hasNoBad(grid) ? -1 : 0  }

        var minu: Int = 0
        countMinute(&minu, maxX, maxY, &grid, &bads, &visited, total)
        return hasNoBad(grid) ?  -1 : minu
    }

    private func countMinute(_ minu: inout Int, _ maxX: Int, _ maxY: Int, _ grid: inout [[Int]], _ bads: inout [[Int]], _ visited: inout [[Int]], _ total: Int) {
        guard !bads.isEmpty else { return }
        guard visited.count < total else { return }

        // 临时收集坏的
        var visited = visited
        var tempBads: [[Int]] = []
        // 遍历
        for b in bads {
            let currentX = b[0]
            let currentY = b[1]
            let currentIsBad = grid[currentX][currentY] == 2
            // 四个方向进行判断
            
            // 1. 上
            let upY = currentY - 1
            if (upY >= 0 && upY <= maxY && !containsInDatas(visited, [currentX, upY])) {
                visited.append([currentX, upY])
                if (currentIsBad && grid[currentX][upY] == 1) {
                    // 已经腐烂
                    grid[currentX][upY] = 2
                    tempBads.append([currentX, upY])
                }
            }

            // 2. 左
            let leftX = currentX - 1
            if (leftX >= 0 && leftX <= maxX && !containsInDatas(visited, [leftX, currentY])) {
                visited.append([leftX, currentY])
                if (currentIsBad && grid[leftX][currentY] == 1) {
                    // 已经腐烂
                    grid[leftX][currentY] = 2
                    tempBads.append([leftX, currentY])
                }
            }

            // 3. 下
            let downY = currentY + 1
            if (downY >= 0 && downY <= maxY && !containsInDatas(visited, [currentX, downY])) {
                visited.append([currentX, downY])
                if (currentIsBad && grid[currentX][downY] == 1) {
                    // 已经腐烂
                    grid[currentX][downY] = 2
                    tempBads.append([currentX, downY])
                }
            }

            // 4. 右
            let rightX = currentX + 1
            if (rightX >= 0 && rightX <= maxX && !containsInDatas(visited, [rightX, currentY])) {
                visited.append([rightX, currentY])
                if (currentIsBad && grid[rightX][currentY] == 1) {
                    // 已经腐烂
                    grid[rightX][currentY] = 2
                    tempBads.append([rightX, currentY])
                }
            }
        }

        // 如果已经没有坏橘子，就提前退出
        guard noBads(tempBads, grid) == false else { return }
        // 累计时间
        minu += 1
        countMinute(&minu, maxX, maxY, &grid, &tempBads, &visited, total)
    }
    
    private func hasNoBad(_ grid: [[Int]]) -> Bool {
        guard !grid.isEmpty else { return false }
        for i in 0..<grid.count {
            let temp = grid[i]
            for j in 0..<temp.count {
                if (temp[j] == 1) { return true }
            }
        }
        return false
    }
    
    private func noBads(_ bads: [[Int]], _ grid: [[Int]]) -> Bool {
        guard !bads.isEmpty else { return true }
        for b in bads {
            let x = b[0]
            let y = b[1]
            if (grid[x][y] == 2) { return false }
        }
        return true
    }

    private func containsInDatas(_ datas: [[Int]], _ e: [Int]) -> Bool {
        guard !datas.isEmpty else { return false }
        for d in datas where e == d {
            return true
        }
        return false
    }
}
