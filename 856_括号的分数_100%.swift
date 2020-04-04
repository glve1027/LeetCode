//
//  856_括号的分数_100%.swift
//  t
//
//  Created by GH on 2020/4/4.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        let datas = Array(S)
        var stack: [Int] = []
        
        for ch in datas {
            if (ch == Character("(")) {
                stack.append(-1)
            } else {
                handleDatas(&stack)
            }
        }
        return stack.reduce(0) { return $0 + $1 }
    }
    
    private func handleDatas(_ stack: inout [Int]) {
        guard !stack.isEmpty else { return }
        
        var count: Int = 0
        var multiply: Bool = false
        while (!stack.isEmpty) {
            let last = stack.removeLast()
            if (last == -1) {
                if (!multiply) { count = 1 }
                break
            } else {
                if (!multiply) { multiply = true }
                count += last
            }
        }
        
        if (multiply) {
            stack.append(count * 2)
        } else {
            stack.append(count)
        }
    }
}
