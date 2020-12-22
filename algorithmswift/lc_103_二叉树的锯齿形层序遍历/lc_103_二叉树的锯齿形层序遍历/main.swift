//
//  main.swift
//  lc_103_二叉树的锯齿形层序遍历
//
//  Created by fl-226 on 2020/12/22.
//  Copyright © 2020 WS. All rights reserved.
//
 
//103. 二叉树的锯齿形层序遍历 （中等）
/*
 给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回锯齿形层序遍历如下：

 [
   [3],
   [20,9],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

let solution = Solution();

let r = TreeNode(3)

let n1 = TreeNode(9)
let n2 = TreeNode(20)

let n3 = TreeNode(15)
let n4 = TreeNode(7)
r.left = n1
r.right = n2

n2.left = n3
n2.right = n4

//var p = 1.0;
//for i in 306...356 {
//    p *= (Double(Float(i)) * 1.0)/365.0
//}
//print(1 - p)
print(solution.zigzagLevelOrder(r))
