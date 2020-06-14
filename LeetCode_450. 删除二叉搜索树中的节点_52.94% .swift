//
//  LeetCode_450. 删除二叉搜索树中的节点_52.94% .swift
//  Coding
//
//  Created by GH on 2020/6/14.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        // 1. find it
        var find = findExactlyNode(root, nil, 0, key)
        // 2. delete it
        var root = root
        deleteExactly(&find, &root)
        
        return root
    }
    
    private func deleteExactly(_ root: inout (node: TreeNode?, parent: TreeNode?, direction: Int), _ before: inout TreeNode?) {
        guard let selfNode = root.node else { return }
        // has two children nodes
        if (selfNode.left != nil && selfNode.right != nil) {
            // 1. find processor / next
            let processor = findProcessor(selfNode)
            guard let processNode = processor.node else { return }
            // 2.  change value to process's value
            selfNode.val = processNode.val
            // 3. delete process node
            if processNode.left != nil && processNode.right != nil { return }
            
            var d = 1
            if let l = processor.parent?.left, let n = processor.node, l.val == n.val {
                d = -1
            }
            var processInfos = (node: processor.node, parent: processor.parent, direction: d)
            deleteExactly(&processInfos, &before)
        } else {
            guard let parentNode = root.parent else {
                // delete root node
                if selfNode.left != nil {
                    before = selfNode.left
                } else if(selfNode.right != nil) {
                    before = selfNode.right
                } else {
                    before = nil
                }
                return
            }
            if (selfNode.left == nil && selfNode.right == nil) {// has none of any child node
                if (root.direction == 1) {
                    parentNode.right = nil
                } else {
                    parentNode.left = nil
                }
            } else if (selfNode.left != nil) {
                if (root.direction == 1) {
                    parentNode.right = selfNode.left
                } else {
                    parentNode.left = selfNode.left
                }
            } else {
                if (root.direction == 1) {
                    parentNode.right = selfNode.right
                } else {
                    parentNode.left = selfNode.right
                }
            }
        }
    }
    /**
     * root: current node
     * parent:parent node
     * direction:
     *             Int: 1 = right
     *             Int: -1 = left
     *             Int: 0
     */
    private func findExactlyNode(_ root: TreeNode?, _ parent: TreeNode?, _ direction: Int, _ key: Int) -> (node: TreeNode?, parent: TreeNode?, direction: Int) {
        guard let root = root else { return (node: nil, parent: nil, direction: 0) }

        if (root.val == key) {
            return (node: root, parent: parent, direction: direction)
        } else if (root.val > key) {
            return findExactlyNode(root.left, root, -1, key)
        } else {
            return findExactlyNode(root.right,root, 1, key)
        }
    }

    private func findProcessor(_ root: TreeNode?) -> (node: TreeNode?, parent: TreeNode?) {
        guard let root = root else { return (node: nil, parent: nil) }

        var parentNode: TreeNode? = root
        var result: TreeNode? = root.left
        
        while result?.right != nil {
            parentNode = result
            result = result?.right
        }
        
        return (node: result, parent: parentNode)
    }
}
