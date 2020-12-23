//
//  Solution1.swift
//  lc_142_环形链表II
//
//  Created by 王燊 on 2020/12/23.
//

import Foundation

// 假设起始点到入环点距离为 a
// 快慢指针相遇点为b  相遇点到入环点剩余距离为c
// 那么快慢指针相遇之时,快指针走的距离为慢指针的两倍 所以 2(a + b) = a + n(b+c) + b
// a = n(b + c) - b  得到 a = (n-1)(b+c) + c  得到 慢指针在当前位置走到入环点的距离为c 等于 起始点到入环点的距离
// 当快慢指针相遇时 设置一个p3指针,从起始点开始移动 那么慢指针和p3会在入环点相遇

class Solution1 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var p1 = head
        var p2 = head!.next
        var p3 : ListNode?
        while p2 != nil {
            if p3 == nil {
                if p1!.val == p2!.val && p1?.next?.val == p2?.next?.val  {
                    p3 = head
                }
            }else {
                if p1!.val == p3!.val && p1?.next?.val == p3?.next?.val {
                    return p1
                }
                p3 = p3?.next
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
