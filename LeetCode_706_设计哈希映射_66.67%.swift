//
//  LeetCode_706_设计哈希映射_66.67%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/17.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation


class MyHashMap {
    
    /** Initialize your data structure here. */
    var datas: [Int: Int] = [:]
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        self.datas[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if let v = self.datas[key] {
            return v
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        if let _ = self.datas[key] { self.datas.removeValue(forKey: key) }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
