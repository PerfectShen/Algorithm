//
//  Solution1.swift
//  lc_50_Pow(x, n)
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

// x的n次方 通过推到可得

// 非递归快速幂
// 时间复杂度 O(logn)
// 空间复杂度 O(1)
class Solution1 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var newN = n < 0 ? -n : n
        var newX = x
        var res = 1.0
        while newN > 0 {
            if newN & 1 == 1 {
                res *= newX
            }
            newX *= newX
            newN >>= 1
        }
        if n < 0 {
            res = 1/res
        }
        return res
    }
}
