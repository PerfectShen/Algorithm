//
//  Solution.swift
//  lc_50_Pow(x, n)
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

// 递归快速幂
// 时间复杂度 O(logn)
// 空间复杂度 O(logn)
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {return 1}
        let odd = (n%2 == 1)
        var half = myPow(x, n/2)
        half *= half
        if odd {
            let newX = n < 0 ? 1/x : x
            half *= newX
        }
        return half
    }
    
    func myPow1(_ x: Double, _ n: Int) -> Double {
        if (n == 0) {
            return 1
        }
        let temp = myPow(x, n/2)
        if (n%2 == 0) {
            return temp * temp
        }
        else {
            if(n > 0) {
                return x * temp * temp
            }
            else {
                return (temp * temp)/x
            }
        }
    }
}




