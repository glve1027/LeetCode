//
//  LeetCode_150_逆波兰表达式求值_78.95%.swift
//  t
//
//  Created by GH on 2020/4/5.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        guard !tokens.isEmpty else { return 0 }

        var stack: [Int] = []
        for t in tokens {
            if let tv = Int(t) {
                stack.append(tv)
            } else {
                handleStack(&stack, t)
            }
        }
        return stack.first ?? 0
    }

    private func handleStack(_ datas: inout [Int], _ operationString: String) {
        guard datas.count >= 2 else { return }

        let last = datas.removeLast()
        let nextLast = datas.removeLast()

        var value: Int = 0
        if (operationString == "+") {
            value = last + nextLast
        } else if (operationString == "-") {
            value = nextLast - last
        } else if (operationString == "*") {
            value = nextLast * last
        } else if (operationString == "/") {
            value = nextLast / last
        } else {
            return
        }

        datas.append(value)
    }
}
