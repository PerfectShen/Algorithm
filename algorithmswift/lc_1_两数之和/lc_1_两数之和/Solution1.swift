//
//  Solution1.swift
//  lc_1_两数之和
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for (i,num) in nums.enumerated() {
            let tmp = target - num
            if map[tmp] != nil {
                return [map[tmp]!,i]
            }else {
                map[num] = i
            }
        }
        return [-1,-1]
    }
}
