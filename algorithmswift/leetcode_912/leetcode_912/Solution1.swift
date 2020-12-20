//
//  Solution1.swift
//  leetcode_912
//
//  Created by 王燊 on 2020/12/19.
//


//冒泡排序

import Foundation


class Solution1 {
    func sortArray(_ nums: [Int]) -> [Int] {
        var oNums = nums
        for i in 0..<oNums.count {
            for j in i..<oNums.count {
                if oNums[i] > oNums[j] {
                    let tmp = oNums[i]
                    oNums[i] = oNums[j]
                    oNums[j] = tmp
                }
            }
        }
        
        return oNums
    }
}
