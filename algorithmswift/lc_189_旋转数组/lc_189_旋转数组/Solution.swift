//
//  Solution.swift
//  lc_189_旋转数组
//
//  Created by 王燊 on 2021/1/8.
//

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count == 0 {return}
        var realK = k%nums.count
        while realK > 0 {
            nums.insert(nums.removeLast(), at: 0)
            realK -= 1
        }
    }
}

