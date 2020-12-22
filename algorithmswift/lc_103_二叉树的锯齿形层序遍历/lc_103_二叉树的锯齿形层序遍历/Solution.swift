//
//  Solution.swift
//  lc_103_二叉树的锯齿形层序遍历
//
//  Created by fl-226 on 2020/12/22.
//  Copyright © 2020 WS. All rights reserved.
//

import Foundation



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var stackLeft = [TreeNode]()  //从左往右
        var stackRight = [TreeNode]()  //从右往左
        var resultArray = [[Int]]()
        var tmpArray = [Int]()
        stackLeft.append(root!) // 将跟节点加入队列
        var operationLeft = true
        while stackLeft.count > 0 || stackRight.count > 0 {
            if operationLeft {
                if stackLeft.count != 0 {
                    let node = stackLeft.removeLast()
                    tmpArray.append(node.val)
                    let left = node.left
                    let right = node.right
                    if left != nil {
                        stackRight.append(left!)
                    }
                    if right != nil {
                        stackRight.append(right!)
                    }
                }else {
                    operationLeft = false;
                    resultArray.append(tmpArray)
                    tmpArray = [Int]()
                    let node = stackRight.removeLast()
                    tmpArray.append(node.val)
                    let left = node.left
                    let right = node.right
                    if right != nil {
                        stackLeft.append(right!)
                    }
                    if left != nil {
                        stackLeft.append(left!)
                    }
                }
            }else {
                if stackRight.count != 0 {
                    let node = stackRight.removeLast()
                    tmpArray.append(node.val)
                    let left = node.left
                    let right = node.right
                    if right != nil {
                        stackLeft.append(right!)
                    }
                    if left != nil {
                        stackLeft.append(left!)
                    }
                }else {
                    operationLeft = true;
                    resultArray.append(tmpArray)
                    tmpArray = [Int]()
                    let node = stackLeft.removeLast()
                    tmpArray.append(node.val)
                    let left = node.left
                    let right = node.right
                    if left != nil {
                        stackRight.append(left!)
                    }
                    if right != nil {
                        stackRight.append(right!)
                    }
                }
            }
            
        }
        resultArray.append(tmpArray)
        return resultArray
    }
}
