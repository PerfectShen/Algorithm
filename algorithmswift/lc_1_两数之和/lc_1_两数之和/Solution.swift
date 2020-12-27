//
//  Solution.swift
//  lc_1_两数之和
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        var res = [Int]() //存放结果下标的数组
        for i in 0..<nums.count {
            let tmp = target - nums[i]
            if map[tmp] != nil {
                res.append(map[tmp]!)
                res.append(i)
            }else {
                map[nums[i]] = i
            }
        }
        return res
    }
}
