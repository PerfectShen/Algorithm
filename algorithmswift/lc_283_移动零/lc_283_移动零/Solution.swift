//
//  Solution.swift
//  lc_283_移动零
//
//  Created by 王燊 on 2020/12/27.
//



import Foundation
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count == 0 {return}
        var curIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                if nums[curIndex] != 0 {
                    curIndex += 1
                }else {
                    nums[curIndex] = nums[i]
                    nums[i] = 0
                    curIndex += 1
                }
            }
        }
    }
}

