//
//  1281_整数的各位积和之差_61.90%.swift
//  Coding
//
//  Created by GH on 2020/1/5.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        guard abs(n) != 0 else { return 0 }

        var n = n
        var temp: [Int] = []
        while n >= 10 {
            let value = n % 10

            temp.insert(value, at: 0)

            n /= 10
        }

        if (n != 0) { temp.insert(n, at: 0) }

        let sum = temp.reduce(0, +)
        let mul = temp.reduce(1, *)
        return mul - sum
    }
}
