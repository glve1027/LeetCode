//
//  LeetCode_530_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/16.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        _ = helper(root)
        return res
    }
    
    var temp: [Int] = []
    var res: Int = Int.max
    // 中序遍历
    private func helper(_ root: TreeNode?) {
        guard let root = root else { return }
        helper(root.left)
        if let last = temp.last, abs(last-root.val) < res {
            res = abs(last-root.val)
        }
        temp.append(root.val)
        helper(root.right)
    }
}
