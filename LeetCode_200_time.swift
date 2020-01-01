//
//  LeetCode_200_time.swift
//  Coding
//
//  Created by GH on 2020/1/1.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        
        var visited: [[Int]] = []
        var landPoints: Set<[Int]> = []
        var yMax: Int = 0
        
        for i in 0..<grid.count {
            let datas = grid[i]
            yMax = datas.count
            for j in 0..<datas.count {
                if (String(datas[j]) == "0") {
                    visited.append([i, j])
                } else {
                    landPoints.insert([i, j])
                }
            }
        }
        
        guard let first = landPoints.first else { return 0 }
        
        var result: Set<[Int]> = []
        var total: [Set<[Int]>] = []
        helper([first], &landPoints, grid, grid.count, yMax, &visited, &result, &total)
        print(total)
        return total.count
    }
    
    private func helper(_ points: Set<[Int]>, _ origin: inout Set<[Int]>, _ resource: [[Character]], _ xMax: Int, _ yMax: Int, _ visited: inout [[Int]], _ result: inout Set<[Int]>, _ total: inout [Set<[Int]>]) {
        
        guard !origin.isEmpty else { return }
        
        var tempPoints: Set<[Int]> = []
        
        for p in points {
            let x = p[0]
            let y = p[1]
            
            //如果已经存在了
            if (!visited.contains([x, y])) {
                visited.append([x, y])
                result.insert([x, y])
            }
            
            
            // 上
            if y - 1 >= 0 && y - 1 < yMax && !visited.contains([x, y-1]) {
                let v = resource[x][y-1]
                if String(v) == "1" {
                    result.insert([x, y-1])
                    tempPoints.insert([x, y-1])
                }
                visited.append([x, y-1])
            }
            
            // 下
            if y + 1 >= 0 && y + 1 < yMax && !visited.contains([x, y+1]) {
                let v = resource[x][y+1]
                if String(v) == "1" {
                    result.insert([x, y+1])
                    tempPoints.insert([x, y+1])
                }
                visited.append([x, y+1])
            }
            
            // 左
            if x - 1 >= 0 && x - 1 < xMax && !visited.contains([x-1, y]) {
                let v = resource[x-1][y]
                if String(v) == "1" {
                    result.insert([x-1, y])
                    tempPoints.insert([x-1, y])
                }
                visited.append([x-1, y])
            }
            
            // 右
            if x + 1 >= 0 && x + 1 < xMax && !visited.contains([x+1, y]) {
                let v = resource[x+1][y]
                if String(v) == "1" {
                    result.insert([x+1, y])
                    tempPoints.insert([x+1, y])
                }
                visited.append([x+1, y])
            }
        }
        
        if tempPoints.isEmpty {
            total.append(result)
            origin = origin.subtracting(result)
            result = []
            if (origin.isEmpty) {
                helper([], &origin, resource, resource.count, yMax, &visited, &result, &total)
            } else {
                helper([origin.first!], &origin, resource, resource.count, yMax, &visited, &result, &total)
            }
        } else {
            helper(tempPoints, &origin, resource, resource.count, yMax, &visited, &result, &total)
        }
    }
}
