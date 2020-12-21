//
//  Solution.swift
//  leetcode_20
//
//  Created by 王燊 on 2020/12/21.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count == 0 { //如果是空的 返回true
            return true
        }
        var map = [String:String]()
        map[")"] = "("
        map["}"] = "{"
        map["]"] = "["
        
        var stack = [String]() //初始化一个数组
        //遍历字符串 和当前栈顶元素比较 如果可以匹配就移除栈顶元素,如无法匹配就将当前 子字符串 入栈,循环结束后如果栈中有值 返回false 如果为空 返回true
        for tmp in s {
            let subS = String(tmp)
            let pair = map[subS]
            if stack.count == 0 {
                stack.append(subS)
            }else {
                let last = stack.last!;
                if pair != nil && last.compare(pair!) == ComparisonResult.orderedSame {
                    stack.removeLast()
                }else {
                    stack.append(subS)
                }
            }
        }
        if stack.count == 0 {
            return true
        }else {
            return false
        }
    }
}
