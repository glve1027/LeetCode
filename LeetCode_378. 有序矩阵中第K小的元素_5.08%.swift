//
//  LeetCode_378. 有序矩阵中第K小的元素_5.08%.swift
//  BinaryHeap
//
//  Created by GH on 2020/8/15.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    let binary = BinaryHeap<Int>()
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        for arr in matrix {
            arr.forEach { binary.add($0) }
        }
        var i = 1
        while i < k {
            print(binary.get())
            i += 1
        }
        return binary.get() ?? -1
    }
}

class BinaryHeap<E: Comparable> {
    public var elements: [E];
    init(_ e: [E]) {
        self.elements = e
        heapify()
    }
    init() {
        self.elements = []
    }

    private func heapify() {
        guard self.elements.count > 1 else { return }
        // 1. from up -> to shifUp
        for i in 0..<self.elements.count {
            shifUp(i)
        }
        // 2. from down -> up shifDown
        /*
        for i in (0..<self.elements.count >> 1).reversed() {
            shifDown(i)
        }
        */
    }

    /**
     * add elements
     */
    public func add(_ e: E) {
        self.elements.append(e)
        shifUp(self.elements.count - 1)
    }
    /**
     * get topest node
     */
    public func get() -> E? {
        guard let firstValue = self.elements.first else { return nil }
        guard self.elements.count > 1 else { return self.elements.removeFirst() }
        let lastValue = self.elements.removeLast()
        self.elements[0] = lastValue
        shifDown(0)
        return firstValue
    }
    /**
     * shifUp
     */
    public func shifUp(_ index: Int) {
        let currentValue = self.elements[index]
        var index = index
        while (index > 0) {
            // 1. get parent index
            let parentIndex = (index - 1) >> 1;
            // 2. get parent value
            let parentValue = self.elements[parentIndex]
            // 3. compare it
            if (parentValue <= currentValue) { break }

            // 4. change value
            self.elements[index] = parentValue
            // 5. change index
            index = parentIndex

        }
        self.elements[index] = currentValue
    }

    /**
     * shifDown
     */
    public func shifDown(_ index: Int) {
        let currentValue = self.elements[index]
        var index = index
        // 1. get first node which has no child nodes
        let firstNoChildIndex = self.elements.count >> 1
        while (index < firstNoChildIndex) {
            // 2. get child index
            var childIndex = (index << 1) + 1
            // 3. get child value
            var childValue = self.elements[childIndex]
            // 4. compare another child node value
            let anotherIndex = childIndex + 1
            if (anotherIndex < self.elements.count && self.elements[anotherIndex] < childValue) {
                childIndex = anotherIndex
                childValue = self.elements[anotherIndex]
            }
            // 5. compare to child value
            if (currentValue <= childValue) { break }
            // 6. change value
            self.elements[index] = childValue
            // 6. change index
            index = childIndex
        }
        self.elements[index] = currentValue
    }

    /**
     * clear
     */
    public func clear() {
        self.elements.removeAll()
    }
}
