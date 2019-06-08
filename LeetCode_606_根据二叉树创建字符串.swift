//
//  LeetCode_606.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/8.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else { return "" }
        var l = tree2str(t.left)
        var r = tree2str(t.right)
        if l == ""  && r == "" {
            return "\(t.val)"
        } else if (l == "" && r != "") {
            return "\(t.val)" + "()(" + "\(r)" + ")"
        } else if (l != "" && r == "") {
            return "\(t.val)" + "(" + "\(l)" + ")"
        } else {
            return "\(t.val)" + "(" + "\(l)" + ")" + "(" + "\(r)" + ")"
        }
    }
}
