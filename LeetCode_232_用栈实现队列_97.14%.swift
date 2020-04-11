//
//  LeetCode_232_用栈实现队列_97.14%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/25.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation


class MyQueue {
    
    /** Initialize your data structure here. */
    var datas: [Int] = []
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        self.datas.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        guard !self.datas.isEmpty else { return -1 }
        return self.datas.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        guard let firstObj = self.datas.first else { return -1 }
        return firstObj
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return self.datas.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

/**
 * 方法2
 */
class MyQueue {

    /** Initialize your data structure here. */
    var inStack: [Int] = []
    var outStack: [Int] = []
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        self.inStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if (self.outStack.isEmpty && self.inStack.isEmpty) { return -1 }

        if (self.outStack.isEmpty) {
            while (!self.inStack.isEmpty) {
                self.outStack.append(self.inStack.removeLast())
            }
        }

        return self.outStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if (self.outStack.isEmpty && self.inStack.isEmpty) { return -1 }

        if (self.outStack.isEmpty) {
            while (!self.inStack.isEmpty) {
                self.outStack.append(self.inStack.removeLast())
            }
        }

        return self.outStack.last ?? -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return self.inStack.isEmpty && self.outStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
