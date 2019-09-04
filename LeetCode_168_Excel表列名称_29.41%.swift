//
//  LeetCode_168_Excel表列名称_29.41%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/4.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func convertToTitle(_ n: Int) -> String {
        let datas = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        guard n > 0 else { return "" }
        if n <= 26 { return datas[n-1] }
        var n = n
        
        var result: [Int] = []
        while n > 26 {
            let number = n % 26
            if (number > 0 && number <= 26) {
                result.insert(number, at: 0)
                n /= 26
            } else {
                // 这里需要注意！！如果可以整除的情况下-> 需要考虑进位
                result.insert(26, at: 0)
                n /= 26
                n -= 1
            }
        }
        if (n > 0 && n <= 26) { result.insert(n, at: 0) }
        return String(result.flatMap { "\(datas[$0-1])" })
    }
}
