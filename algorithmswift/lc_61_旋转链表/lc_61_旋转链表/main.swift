//
//  main.swift
//  lc_61_旋转链表
//
//  Created by 王燊 on 2020/12/25.
//

// 61. 旋转链表 (中等)
/*
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

 示例 1:

 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:

 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation



var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
var node5 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

var p : ListNode? = node1
var index = 0
while p != nil {
    print("index = \(index),p.val = \(p!.val)")
    index += 1
    p = p!.next
}


print("转换之后 ------")
let solution = Solution()
let newNode = solution.rotateRight(node1, 2)

p = newNode
index = 0
while p != nil {
    print("index = \(index),p.val = \(p!.val)")
    index += 1
    p = p!.next
}
