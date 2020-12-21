//
//  Solution.swift
//  leetcode_187
//
//  Created by 王燊 on 2020/12/21.
//

import Foundation

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let len = 10
        if s.count < len {
            return []
        }
        var resultArray = [String]()
        var map = [String:Int]()
        for i in 0..<s.count {
            if i+len <= s.count {
                let indexStart = s.startIndex
                let indexL = s.index(indexStart, offsetBy: i)
                let indexR = s.index(indexL, offsetBy:len)
                let sub : String = String(s[indexL..<indexR])
                var count = map[sub]
                if count == nil {
                    count = 0
                }
                count! = count! + 1;
                map[sub] = count!
                if count! == 2 {
                    resultArray.append(sub)
                }
            }
        }
        return resultArray
    }
}
