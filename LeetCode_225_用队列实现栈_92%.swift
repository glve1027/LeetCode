//
//  LeetCode_225_用队列实现栈_92%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/25.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation


class MyStack {
    
    /** Initialize your data structure here. */
    var datas: [Int] = []
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        self.datas.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        guard !self.datas.isEmpty else { return -1 }
        return self.datas.removeLast()
    }
    
    /** Get the top element. */
    func top() -> Int {
        guard let lastObj = self.datas.last else { return -1 }
        return lastObj
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return self.datas.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
