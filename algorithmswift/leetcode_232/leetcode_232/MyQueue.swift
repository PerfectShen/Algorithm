//
//  MyQueue.swift
//  leetcode_232
//
//  Created by 王燊 on 2020/12/21.
//

import Foundation

class MyQueue {

    var inStack : [Int]!   //对队尾进行操作
    var outStack : [Int]! // 对队尾进行操作
    var size : Int
    /** Initialize your data structure here. */
    init() {
        size = 0
        inStack = [Int]()
        outStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inStack.append(x)
        size += 1
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        checkOutStack()
        if size > 0 {
            let last = outStack.removeLast()
            size -= 1
            return last
        }else {
            return 0
        }
        
    }
    
    /** Get the front element. */
    func peek() -> Int {
        checkOutStack()
        let last = outStack.last
        if last == nil {
            return 0
        }else {
            return last!
        }
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        if size == 0 {
            return true
        }else {
            return false
        }
    }
    
    private func checkOutStack() {
        if outStack.count == 0 { //将入栈中的元素放入出栈中
            for i in 0..<inStack.count {
                let tmp = inStack[inStack.count - 1 - i]
                outStack.append(tmp)
            }
            inStack.removeAll()
        }
        
    }
}

