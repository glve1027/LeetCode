//
//  LeetCode_657_机器人能否返回原点.swift
//  Coding
//
//  Created by GongHuan on 2019/7/11.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        let datas = Array(moves)
        guard !datas.isEmpty else { return true }
        if !datas.contains(Character("R")) && !datas.contains(Character("L")) && !datas.contains(Character("U")) && !datas.contains(Character("D")) { return true }
        var tunple: (x: Int, y: Int) = (x: 0, y: 0)
        for v in datas {
            if (v == Character("R")) {
                tunple.x += 1
            } else if (v == Character("L")) {
                tunple.x -= 1
            } else if (v == Character("U")) {
                tunple.y += 1
            } else {
                tunple.y -= 1
            }
        }
        return tunple.x == 0 && tunple.y == 0
    }
}
