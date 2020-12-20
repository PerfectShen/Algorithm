//
//  Solution.swift
//  leetcode_617
//
//  Created by 王燊 on 2020/12/19.
//

import Foundation


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
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil && t2 == nil {
            return nil
        }
        let root = TreeNode(0)
        visit(t1,t2,root)
        return root
    }
    
    func visit(_ t1: TreeNode? , _ t2: TreeNode?,_ rt : TreeNode?) {
        if t1 == nil && t2 == nil {
            return
        }
        let v1 = t1?.val ?? 0;
        let v2 = t2?.val ?? 0;
        rt?.val = v1 + v2;
//        print(rt?.val)
        
        let left1  = t1?.left
        let right1 = t1?.right
        let left2  = t2?.left
        let right2 = t2?.right
        
        if left1 != nil || left2 != nil{
            let newLeft = TreeNode(0)
            rt?.left = newLeft;
            visit(left1,left2,newLeft)
        }
        
        if right1 != nil || right2 != nil {
            let newRight = TreeNode(0)
            rt?.right = newRight;
            visit(right1,right2,newRight)
        }
        
        
    }
}
