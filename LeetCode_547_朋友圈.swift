//
//  LeetCode_547_朋友圈.swift
//  Coding
//
//  Created by GongHuan on 2019/7/11.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        var friends: [Int: Set<Int>] = [:]
        for i in 0..<M.count { friends[i] = [i] }
        
        var res: [Set<Int>] = []
        
        for i in 0..<M.count {
            let subDatas = M[i]
            for j in 0..<subDatas.count {
                let value = subDatas[j]
                if (i != j && value == 1) {
                    let iFriends = friends[i]!
                    let jFriends = friends[j]!
                    
                    let unionData = iFriends.union(jFriends)
                    for v in unionData where v != i && v != j && unionData != friends[v]! {
                        friends[v] = unionData
                    }
                    friends[i] = unionData
                    friends[j] = unionData
                }
            }
        }
        
        for v in friends.values where !res.contains(v) { res.append(v) }
        return res.count
    }
}
