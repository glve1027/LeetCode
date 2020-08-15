//
//  LeetCode_451. 根据字符出现频率排序_30%.swift
//  BinaryHeap
//
//  Created by GH on 2020/8/15.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    var maps: [Character: Int] = [:]
    func frequencySort(_ s: String) -> String {
        for c in Array(s) {
            if var count = maps[c] {
                count += 1
                maps[c] = count
            } else {
                maps[c] = 1
            }
        }

        let binaryHeap = BinaryHeap<CountString>()
        for (k, v) in maps {
            binaryHeap.add(CountString(c: k, i: v))
        }
        
        var results: [Character] = []
        while (true) {
            guard let node = binaryHeap.get() else { break }
            for _ in 1...node.i {
                results.append(node.c)
            }
        }
        return String(results)
    }
}

struct CountString: BinaryHeapComparable {
    func compare(other: CountString) -> Int {
        return i - other.i
    }
    
    let c: Character
    let i: Int
}

protocol BinaryHeapComparable {
    /**
     * > 0  => self > other
     * == 0 => self = other
     * < 0  => self < other
     */
    func compare (other: Self) -> Int
}

class BinaryHeap<E: BinaryHeapComparable> {
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
        heapify()
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
            if (parentValue.compare(other: currentValue) >= 0) { break }
            
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
            if (anotherIndex < self.elements.count && self.elements[anotherIndex].compare(other: childValue) > 0) {
                childIndex = anotherIndex
                childValue = self.elements[anotherIndex]
            }
            // 5. compare to child value
            if (currentValue.compare(other: childValue) >= 0) { break }
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
