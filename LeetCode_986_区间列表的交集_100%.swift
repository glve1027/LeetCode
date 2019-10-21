//
//  LeetCode_986_区间列表的交集_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/21.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        guard !A.isEmpty, !B.isEmpty else { return [] }
        var a: Int = 0
        var b: Int = 0
        var aDatas: [Int] = A[0]
        var bDatas: [Int] = B[0]
        var result: [[Int]] = []
        while a <= A.count - 1 || b <= B.count - 1 {
            // 判断是否一个集合已经全部检查过了
            if (a <= A.count - 1) {
                aDatas = A[a]
            } else {
                b += 1
                continue
            }
            if (b <= B.count - 1) {
                bDatas = B[b]
            } else {
                a += 1
                continue
            }
            
            let af = aDatas[0]
            let al = aDatas[1]
            let bf = bDatas[0]
            let bl = bDatas[1]
            if (af >= bf && af <= bl) {
                // 判断是否是子集
                if (al < bl) {
                    result.append([af, al])
                    a += 1
                } else {
                    result.append([af, bl])
                    b += 1
                }
            } else if (bf >= af && bf <= al) {
                // 判断是否是子集
                if (bl < al) {
                    result.append([bf, bl])
                    b += 1
                } else {
                    result.append([bf, al])
                    a += 1
                }
            } else if (af > bl) {
                b += 1
            } else {
                a += 1
            }
        }
        return result
    }
}
