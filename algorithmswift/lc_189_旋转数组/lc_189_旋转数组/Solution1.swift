//
//  Solution1.swift
//  lc_189_旋转数组
//
//  Created by 王燊 on 2021/1/8.
//

import Foundation


// 先将所有的元素翻转
// 然后前k个翻转 后count - k个翻转
class Solution1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let realK = k%nums.count
        if realK == 0 {return}
        nums.reverse()
        for i in 0..<nums.count {
            let tmp = nums[i]
            if i < realK/2 {
                nums[i] = nums[realK - i - 1]
                nums[realK - i - 1] = tmp
            }else if ( i >= realK && i < (realK + nums.count)/2) {
                nums[i] = nums[nums.count - i + realK - 1]
                nums[nums.count - i + realK - 1] = tmp
            }
        }
    }
}
