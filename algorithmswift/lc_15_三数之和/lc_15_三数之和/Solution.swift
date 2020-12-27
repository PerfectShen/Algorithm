//
//  Solution.swift
//  lc_15_三数之和
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

// 优化后的暴力解法  时间复杂度 O(n^2)


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {return [[Int]]()}
        var res = [[Int]]()
        var li = 0
        var ri = 0
        var newNums = nums
        newNums.sort()
        for (i,num) in newNums.enumerated() {
            if i > 0 && newNums[i] == newNums[i - 1] {continue}
            li = i + 1
            ri = newNums.count - 1
            while li < ri {
                if num + newNums[li] + newNums[ri] == 0 {
                    let subRes = [num,newNums[li],newNums[ri]]
                    res.append(subRes)
                    while li < ri && newNums[li] == newNums[li + 1] {li += 1}
                    while li < ri && newNums[ri] == newNums[ri - 1] {ri -= 1}
                    li += 1
                    ri -= 1
                }else if num + newNums[li] + newNums[ri] > 0 {
                    ri -= 1
                }else {
                    li += 1
                }
            }
        }
        return res
    }
}



