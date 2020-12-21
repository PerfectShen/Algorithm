//
//  Solution.swift
//  leetcode_54
//
//  Created by 王燊 on 2020/12/21.
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
//    var resultArray : [Int]
//
//    init() {
//        self.resultArray = [Int]()
//    }
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return Int.min
        }
        var resultArray = [Int]()
        midtravel(root!,&resultArray)
        return resultArray[resultArray.count - k]
    }
    
    private func midtravel(_ node : TreeNode?,_ resultArray : inout [Int]) -> Void {
        if node == nil {
            return
        }
        midtravel(node!.left,&resultArray)
        resultArray.append(node!.val)
        midtravel(node!.right,&resultArray)
    }
}
