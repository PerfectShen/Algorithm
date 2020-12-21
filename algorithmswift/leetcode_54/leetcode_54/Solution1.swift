//
//  Solution1.swift
//  leetcode_54
//
//  Created by 王燊 on 2020/12/21.
//

import Foundation

//Definition for a binary tree node.
//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}




// 根据搜索树的 前三个元素判断是 前序/中序/后序 搜索树
// 然后按照其对应的 前序中序后序方法进行遍历树
// 遍历完成后形成一个有序(降序)的数组 就可以根据查找下标第k-1的节点

class Solution1 {
    var resultArray : [Int]
    
    init() {
        self.resultArray = [Int]()
    }
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return Int.min
        }
        
        midtravel(root!)
        return resultArray[k-1]
//        self.resultArray = [Int]
        
        
//        let rootval = root!.val
//        let left = root!.left
//        let right = root!.right
//        if left != nil && right != nil { //左右都有值
//            let leftval = left!.val;
//            let rightval = right!.val
//
//            if rootval > leftval  && rootval > rightval { //前序遍历
//
//            }else if leftval > rootval && rootval > rightval { //中序遍历
//
//            }else { //后序遍历
//
//            }
//        }else {
//            if left == nil { // 左边为空
//                let rightval = right!.val
//
//            }else { //右边为空
//                let leftval = left!.val;
//            }
//        }
        
        
    }
    
    
//    func pretravel(_ node : TreeNode, _ array : inout [Int]) -> Void {
//        return [0]
//    }
    
    
    private func midtravel(_ node : TreeNode) -> Void {
        
        
    }
    
//    func suftravel(_ node : TreeNode) -> [Int] {
//        return [0]
//    }
    
}
