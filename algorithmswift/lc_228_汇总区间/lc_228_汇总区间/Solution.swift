//
//  Solution.swift
//  lc_228_汇总区间
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {return [] }
        if nums.count == 1 {return ["\(nums[0])"] }
        var res = [String]()
        var i = 0
        var j = i + 1
        var oNums = nums
        oNums.append(Int.max)
        while i < oNums.count - 1 {
            if oNums[j] - oNums[i] == j - i {
                j += 1
            }else {
                if j - 1 == i {
                    res.append("\(oNums[i])")
                }else {
                    res.append("\(oNums[i])->\(oNums[j - 1])")
                }
                i = j
                j = i + 1
            }
        }
//        if j - 1 == i {
//            res.append("\(nums[i])")
//        }else {
//            res.append("\(nums[i])->\(nums[j - 1])")
//        }
        return res
        
    }
}
