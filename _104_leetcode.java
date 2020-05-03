package com.gh;

import java.util.LinkedList;
import java.util.Queue;

public class _104_二叉树的最大深度 {
    /**
     * 递归
     * @param root
     * @return
     */
    public int maxDepth1(TreeNode root) {
        if (root == null) return 0;
        return Math.max(maxDepth(root.left), maxDepth(root.right)) + 1;
    }
    /**
     * 迭代 - 层序遍历
     * @param root
     * @return
     */
    public int maxDepth(TreeNode root) {
        if (root == null) return 0;

        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        int height = 0;
        int levelSize = 1;

        while (!queue.isEmpty()) {
            TreeNode currentNode = queue.poll();
            levelSize --;

            if (currentNode.left != null) {
                queue.offer(currentNode.left);
            }

            if (currentNode.right != null) {
                queue.offer(currentNode.right);
            }

            if (levelSize == 0) {
                levelSize = queue.size();
                height ++;
            }
        }

        return height;
    }
}

