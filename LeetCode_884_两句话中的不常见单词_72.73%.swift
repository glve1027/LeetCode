//
//  LeetCode_1.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/5.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        let Adatas = A.components(separatedBy: " ")
        let Bdatas = B.components(separatedBy: " ")
        
        let Bmap = conver2Map(Bdatas)
        let Amap = conver2Map(Adatas)
    
        return calculate(Amap, Bmap) + calculate(Bmap, Amap)
    }
    
    private func calculate(_ map: [String: Int], _ base: [String: Int]) -> [String] {
        var result: [String] = []
        
        for (k, v) in map where v == 1 {
            if let _ = base[k] { 
                continue 
            } else {
                result.append(k)
            }
        }
        
        return result
    }
    
    private func conver2Map(_ datas: [String]) -> [String: Int] {
        var result: [String: Int] = [:]
        for a in datas {
            if var count = result[a] {
                count += 1
                result[a] = count
            } else {
                result[a] = 1
            }
        }
        return result
    }
}
