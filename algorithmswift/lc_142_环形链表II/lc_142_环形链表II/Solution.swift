//
//  Solution.swift
//  lc_142_环形链表II
//
//  Created by 王燊 on 2020/12/23.
//

import Foundation


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var p1 = head
        var p2 = head!.next
        var map = [Int:[ListNode]]()
        while p2 != nil {
            if map[p1!.val] != nil {
                var array =  map[p1!.val]
                for node in array! {
                    if p1!.val == node.val && p1!.next!.val == node.next!.val {
                        return p1
                    }
                }
                array!.append(p1!)
                map[p1!.val] = array!
            }else {
                var array = map[p1!.val]
                if array == nil {
                    array = [ListNode]()
                }
                array!.append(p1!)
                map[p1!.val] = array!
            }
            p1 = p1!.next
            if p2!.next != nil {
                p2 = p2!.next!.next
            }else {
                return nil
            }
        }
        return nil
    }
}
