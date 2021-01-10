//
//  Solution.swift
//  lc_1190_反转每对括号间的子串
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

// 括号匹配首先想到栈
class Solution {
    func reverseParentheses(_ s: String) -> String {
        let slist = s.map({$0})
        var res = [Character]()
        for i in 0..<slist.count  {
            let tmp = slist[i]
            if tmp == ")" {
                var last = res.removeLast()
                var queue = [Character]()
                while last != "(" {
                    queue.append(last)
                    last = res.removeLast()
                }
                res.append(contentsOf: queue)
            }else {
                res.append(tmp)
            }
        }
        var resString = ""//res.joined(separator: "")
        for c in res {
            resString.append(c)
        }
        return resString
    }
}

// stack 0 2 4
//  "(u(l(ov)e)i)"
//   .i.love.u.

//  (ui)(ab)
//  iuba

// l r
// lu
