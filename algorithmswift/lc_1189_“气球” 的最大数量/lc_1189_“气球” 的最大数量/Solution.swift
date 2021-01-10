//
//  Solution.swift
//  lc_1189_“气球” 的最大数量
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

// balloon
class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var map = [String:Int]()
        for c  in text {
            let key = String(c)
            if map[key] == nil {
                map[key] = 1
            }else {
                map[key]! += 1
            }
        }
        let b_count = map["b"] ?? 0
        let a_count = map["a"] ?? 0
        let l_count = map["l"] ?? 0
        let o_count = map["o"] ?? 0
        let n_count = map["n"] ?? 0
        
        return min(min(min(min(b_count, a_count), l_count/2), o_count/2), n_count)
    }
}
