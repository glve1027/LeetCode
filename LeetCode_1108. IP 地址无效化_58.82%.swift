//
//  LeetCode_1108. IP 地址无效化_58.82%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/13.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}
