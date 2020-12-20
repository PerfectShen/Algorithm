//
//  main.swift
//  leetcode_617
//
//  Created by 王燊 on 2020/12/19.
//



// 617 合并二叉树 (简单)
/*
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

 示例 1:

 输入:
     Tree 1                     Tree 2
           1                         2
          / \                       / \
         3   2                     1   3
        /                           \   \
       5                             4   7
 输出:
 合并后的树:
          3
         / \
        4   5
       / \   \
      5   4   7
 注意: 合并必须从两个树的根节点开始。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-binary-trees
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


import Foundation


let solution = Solution();

var root = TreeNode(1)
var left1 = TreeNode(3)
var right1 = TreeNode(2)
var left2 = TreeNode(5)
root.left = left1;
root.right = right1;
left1.left = left2;


var root2 = TreeNode(2)
var left2_1 = TreeNode(1)
var right2_1 = TreeNode(3)
var right2_2_1 = TreeNode(4)
var right2_2_2 = TreeNode(7)
root2.left = left2_1;
root2.right = right2_1;
left2_1.right = right2_2_1;
right2_1.right = right2_2_2;
//root2.left = left2_1;


let result = solution.mergeTrees(root, root2)
print(result)
