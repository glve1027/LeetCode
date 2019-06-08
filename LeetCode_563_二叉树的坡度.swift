//
//  LeetCode_563.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/8.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var res: Int = 0
    func findTilt(_ root: TreeNode?) -> Int {
        _ = reFind(root)
        return res
    }
    
    /*
     ** 返回一个tunple: 1: 坡度   2. 总和
     */
    private func reFind(_ root: TreeNode?) -> (tilt: Int, sum: Int) {
        guard let root = root else { return (tilt: 0, sum: 0) }
        if root.left == nil && root.right == nil { return (tilt: 0, sum: root.val) }
        let lData = reFind(root.left)
        let rData = reFind(root.right)
        let v = (tilt: abs(lData.sum - rData.sum), sum: lData.sum + rData.sum + root.val)
        res += v.tilt
        return v
    }
}
