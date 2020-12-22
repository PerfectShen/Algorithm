//
//  main.c
//  leetcode_46
//
//  Created by 王燊 on 2020/12/9.
//

#include <stdio.h>
#include <stdlib.h>

//MARK: 题目描述
/*
 
 给出两个非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 */


//MARK: 解题思路
//1. 分别将两个链表中的数字转化为对应的整数,求和后再转化为链表 . 需要考虑到溢出问题. 就此题目来看此解法不符合
//2. 直接将两个链表中的各位数字相加 并遵循加减法则进行进位

struct ListNode {
     int val;
     struct ListNode *next;
};

//struct ListNode* addTwoNumbers1(struct ListNode* l1, struct ListNode* l2){
//
//    struct ListNode *node1 = l1;
//    struct ListNode *node2 = l2;
//
//    long num1 = 0;
//    long ratio = 1;
//    while (node1 != NULL) {
//        num1 = num1 + node1->val * ratio;
//        node1 = node1->next;
//        ratio = ratio * 10;
//    }
//
//    long  num2 = 0;
//    ratio = 1;
//    while (node2 != NULL) {
//        num2 = num2 + node2->val * ratio;
//        node2 = node2->next;
//        ratio = ratio * 10;
//    }
//
//    long long  num3 = num1 + num2;
//    struct ListNode *node3 = l1;
//    while (num3 > 0) {
//        int tmpNum = num3%10;
//        num3 = num3/10;
//
//        node3->val = tmpNum;
//        struct ListNode *nextNode = node3->next;
//        if (nextNode == NULL && num3 > 0) {
//            nextNode = (struct ListNode *)malloc( sizeof(struct ListNode));
//            nextNode->val = 0;
//            nextNode->next = NULL;
//            node3->next = nextNode;
//            node3 = node3->next;
//        }else {
//            node3 = node3->next;
//        }
//
//    }
//    return l1;
//
//}

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2){
    
    struct ListNode *node1 = l1;
    struct ListNode *node2 = l2;
    int carrynum = 0;
    while (node1 != NULL || node2 != NULL) {
        int val1 = 0;
        int val2 = 0;
        if (node1 != NULL) {
            val1 = node1->val;
        }
        if (node2 != NULL) {
            val2 = node2->val;
        }
        int sum = val1 + val2 + carrynum;
        carrynum = 0;
        if (sum >= 10) {
            sum = sum - 10;
            carrynum = 1;
        }
        node1->val = sum;
        struct ListNode *nextNode = node1->next;
        
        if (node2 != NULL) {
            node2 = node2->next;
            if ((nextNode == NULL && node2 != NULL) || (nextNode == NULL && carrynum != 0)) {
                nextNode = (struct ListNode *)malloc( sizeof(struct ListNode));
                nextNode->val = 0;
                nextNode->next = NULL;
                node1->next = nextNode;
                node1 = node1->next;
            }else {
                node1 = node1->next;
            }
        }else {
            if (nextNode == NULL && carrynum != 0) {
                nextNode = (struct ListNode *)malloc( sizeof(struct ListNode));
                nextNode->val = 0;
                nextNode->next = NULL;
                node1->next = nextNode;
                node1 = node1->next;
            }else {
                node1 = node1->next;
            }
        }
        
    }
    return l1;

}


int main(int argc, const char * argv[]) {
    // insert code here...
    struct ListNode *l1 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l1_1 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l1_2 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l1_3 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l1_4 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l1_5 = (struct ListNode *)malloc( sizeof(struct ListNode));

    l1->val = 2;
    l1->next = l1_1;
    l1_1->val =4;
    l1_1->next = l1_2;
    l1_2->val = 9;
    l1_2->next = NULL;
//    l1_3->val = 9;
//    l1_3->next = l1_4;
//    l1_4->val = 9;
//    l1_4->next = l1_5;
//    l1_5->val = 9;
//    l1_5->next = NULL;
//
    
    

    
    struct ListNode *l2 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l2_1 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l2_2 = (struct ListNode *)malloc( sizeof(struct ListNode));
    struct ListNode *l2_3 = (struct ListNode *)malloc( sizeof(struct ListNode));

    l2->val = 5;
    l2->next = l2_1;
    l2_1->val =6;
    l2_1->next = l2_2;
    l2_2->val = 4;
    l2_2->next = l2_3;
    l2_3->val = 9;
    l2_3->next = NULL;
    
    
    struct ListNode *l3 = addTwoNumbers(l1, l2);
    struct ListNode *p = l3;
    while (p != NULL) {
        printf("%d\n",p->val);
        p = p->next;
    }
    

    printf("Hello, World!\n");
    return 0;
}
