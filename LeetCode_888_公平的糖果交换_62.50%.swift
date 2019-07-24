//
//  LeetCode_888_公平的糖果交换_62.50%.swift
//  Coding
//
//  Created by GongHuan on 2019/7/24.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        let aValue = calculate(A)
        let bValue = calculate(B)
        guard aValue.total != bValue.total else { return [] }
        let finalTotal = (aValue.total + bValue.total) / 2
        
        if (A.count > B.count) {
            let space = abs(bValue.total -  finalTotal)
            if (bValue.total > finalTotal) {
                for v in B {
                    if let _ = aValue.mapData[v-space] {
                        return [v-space, v]
                    }
                }
            } else {
                for v in B {
                    if let _ = aValue.mapData[v+space] {
                        return [v+space, v]
                    }
                }
            }
        } else {
            let space = abs(aValue.total -  finalTotal)
            if (aValue.total > finalTotal) {
                for v in A {
                    if let _ = bValue.mapData[v-space] {
                        return [v, v-space]
                    }
                }
            } else {
                for v in A {
                    if let _ = bValue.mapData[v+space] {
                        return [v, v+space]
                    }
                }
            }
        }
        return []
    }
    
    private func calculate(_ A: [Int]) -> (total: Int, mapData: [Int: Int]) {
        var result: Int = 0
        var map: [Int: Int] = [:]
        _ = A.map {
            result += $0
            if var count = map[$0] {
                count += 1
                map[$0] = count
            } else {
                map[$0] = 1
            }
        }
        return (total: result, mapData: map)
    }
}
