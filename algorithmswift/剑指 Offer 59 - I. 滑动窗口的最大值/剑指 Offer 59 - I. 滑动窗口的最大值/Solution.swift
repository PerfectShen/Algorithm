//
//  Solution.swift
//  剑指 Offer 59 - I. 滑动窗口的最大值
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {return [Int]()}
        var res = [Int]()
        for i in 0..<nums.count - k + 1 {
            var max = Int.min
            for j in i..<i+k {
                if max < nums[j] {
                    max = nums[j]
                }
            }
            res.append(max)
        }
        return res
    }
    
}


class Solution1 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {return [Int]()}
        var res = [Int]()
        var currMax = Int.min
        var maxIndex = -1
        for i in 0..<nums.count - k + 1 {
            if maxIndex < i {
                currMax = Int.min
                for j in i..<i+k {
                    if currMax < nums[j] {
                        currMax = nums[j]
                        maxIndex = j
                    }
                }
                res.append(currMax)
            }else {
                if currMax <= nums[i + k - 1] {
                    currMax = nums[i + k - 1]
                    maxIndex = i + k - 1
                }
                res.append(currMax)
            }
            
        }
        return res
    }
    
}
