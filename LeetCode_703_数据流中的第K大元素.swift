//
//  LeetCode_703_031.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/4.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class KthLargest {
    var k: Int
    var nums: [Int]
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
        if self.nums.count > 1 { qSort(0, self.nums.count - 1, nums: &self.nums) }
    }
    
    func add(_ val: Int) -> Int {
        if self.nums.isEmpty {
            self.nums.append(val)
        } else {
            insert(val, 0, self.nums.count - 1)
        }
        return find(self.nums.count - self.k, self.nums.count - 1)
    }
    
    // MARK: -- insert
    // 二分查找的思路来插入
    private func insert(_ val: Int, _ from: Int, _ to: Int) {
        let first = self.nums[from]
        let last = self.nums[to]
        if val <= first {
            self.nums.insert(val, at: from)
        } else if val >= last {
            self.nums.insert(val, at: to + 1)
        } else {
            let mid = (from + to)/2
            if val == self.nums[mid] {
                self.nums.insert(val, at: mid)
            } else if val > self.nums[mid] {
                insert(val, mid + 1, to)
            } else {
                insert(val, from, mid - 1)
            }
        }
    }
    
    // MARK: -- find
    private func find(_ from: Int, _ to: Int) -> Int {
        guard from <= to, from >= 0, from <= self.nums.count - 1, to >= 0, to <= self.nums.count - 1 else { return -1 }
        let sortedData = self.nums[from...to]
        guard let first = sortedData.first else { return -1 }
        return first
    }
    
    // MARK: -- sorted
    // 快排
    private func qSort(_ from: Int, _ to: Int, nums: inout [Int]) {
        if (from < to) {
            let part = partition(from, to, nums: &nums)
            qSort(from, part, nums: &nums)
            qSort(part + 1, to, nums: &nums)
        }
    }
    
    // MARK: -- partition
    private func partition(_ from: Int, _ to: Int, nums: inout [Int]) -> Int {
        var from = from
        var to = to
        let indexNumber = nums[from]
        while from < to {
            
            while nums[to] >= indexNumber && to > from {
                to -= 1
            }
            nums[from] = nums[to]
            
            while nums[from] <= indexNumber && to > from {
                from += 1
            }
            nums[to] = nums[from]
        }
        
        nums[from] = indexNumber
        return from
    }
}

// 最小堆
class KthLargest {
    var queue: PriorityQueue
    var k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.queue = PriorityQueue()
        self.k = k
        
        for val in nums {
            self.queue.enqueue(val)
        }
        
        var temp = nums.count - k
        while temp > 0 {
            self.queue.dequeue()
            temp -= 1
        }
    }
    
    func add(_ val: Int) -> Int {
        queue.enqueue(val)
        if queue.array.count > k {
            queue.dequeue()
        }
        return queue.peek()!
    }
}

struct PriorityQueue {
    var array = [Int]()
    
    func peek() -> Int? {
        return array.first
    }
    
    mutating func enqueue(_ num: Int) {
        array.append(num)
        siftUp()
    }
    
    mutating func dequeue() {
        array.swapAt(0, array.count - 1)
        array.removeLast()
        siftDown()
    }
    
    mutating func siftDown() {
        var pIndex = 0
        var sLIndex = 0
        var sRIndex = 0
        var index = 0
        
        while pIndex * 2 + 1 <= array.count - 1  {
            sLIndex = pIndex * 2 + 1
            sRIndex = pIndex * 2 + 2
            index = pIndex
            
            if array[pIndex] > array[sLIndex] {
                index = sLIndex
            }
            
            if sRIndex <= array.count - 1 && array[index] > array[sRIndex] {
                index = sRIndex
            }
            
            if (pIndex != index) {
                array.swapAt(pIndex, index)
                pIndex = index
            } else {
                return
            }
        }
    }
    
    mutating func siftUp() {
        var pIndex = 0
        var sIndex = array.count - 1
        
        while sIndex != 0 {
            pIndex = (sIndex - 1) / 2
            if (array[sIndex] < array[pIndex]) {
                array.swapAt(sIndex, pIndex)
                sIndex = pIndex
            } else {
                return
            }
        }
    }
}
