//
//  Solution.swift
//  lc_61_旋转链表
//
//  Created by 王燊 on 2020/12/25.
//

import Foundation


/*
 1. 第一次循环 先将链表尾部的next指向头节点 head,并计算出链表节点总个数 count
 2. 通过观察归纳可得向右旋转k步后 新的链表头节点为 count - k%count 尾节点为  count - k%count - 1
 3. 通过循环遍历链表找到  count - k%count - 1位置的节点 p, p.next为头节点,再将p.next置空
 4. 可得旋转后的链表
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}




class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var p = head
        var count = 0
        var lastNode : ListNode!
        while p != nil {
            count += 1
            lastNode = p!
            p = p!.next
        }
        lastNode.next = head //将尾节点next指向头结点
        let move = k%count //计算出移动的未知如果k大于count 取余数可的最小移动距离
        
        p = head
        var index = 0
        let newHeadIndex = count - move - 1
        var newHead : ListNode!
        while p != nil {
            if index == newHeadIndex {
                newHead = p!.next
                p!.next = nil
                break
            }
            index += 1
            p = p!.next
        }
        return newHead
    }
}

