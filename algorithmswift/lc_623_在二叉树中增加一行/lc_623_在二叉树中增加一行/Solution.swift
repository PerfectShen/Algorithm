//
//  Solution.swift
//  lc_623_在二叉树中增加一行
//
//  Created by 王燊 on 2021/1/10.
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
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        var queue = [TreeNode]();
        if d == 1 {
            let newNode = TreeNode(v)
            newNode.left = root
            return newNode
        }
        queue.append(root!)
        var currentd = 1
        var levelSize = queue.count
        while !queue.isEmpty {
            let node = queue.remove(at: 0)
            if currentd == d - 1 {
                let newLeft = TreeNode(v)
                if let left = node.left {
                    newLeft.left = left
                }
                node.left = newLeft
                let newRight = TreeNode(v)
                if let right = node.right {
                    newRight.right = right
                }
                node.right = newRight
            }else if currentd < d - 1 {
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }else {
                break
            }
            
            levelSize -= 1
            if levelSize == 0 {
                currentd += 1
                levelSize = queue.count
            }
        }
        return root
    }
    
    
}
