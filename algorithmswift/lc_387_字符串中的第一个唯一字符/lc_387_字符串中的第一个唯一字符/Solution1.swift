//
//  Solution1.swift
//  lc_387_字符串中的第一个唯一字符
//
//  Created by fl-226 on 2020/12/23.
//  Copyright © 2020 WS. All rights reserved.
//

import Foundation

class Solution1 {
    func firstUniqChar(_ s: String) -> Int {
        
        var array = [Int]()
        let a : Character = "a"
        for _ in 0...25 {
            array.append(0)
        }
        for ch in s {
            array[Int(ch.asciiValue!) - Int(a.asciiValue!)] += 1
        }
        
        var index = 0
        for ch in s {
            if array[Int(ch.asciiValue!) - Int(a.asciiValue!)] == 1 {
                return index
            }
            index += 1
        }
        return -1
    }
}
