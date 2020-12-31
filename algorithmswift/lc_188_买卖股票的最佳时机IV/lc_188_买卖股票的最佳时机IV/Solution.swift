//
//  Solution.swift
//  lc_188_买卖股票的最佳时机IV
//
//  Created by fl-226 on 2020/12/31.
//  Copyright © 2020 WS. All rights reserved.
//




import Foundation

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.count < 2 || k < 1  {
            return 0
        }
        var p1 = 0
        var p2 = 1
        var result = [Int]()
        while p2 + 1 < prices.count {
            if prices[p1] >= prices[p2]  { //
                p1 += 1
                p2 += 1
            }else {
                if prices[p2 + 1] > prices[p2] {
                    p2 += 1
                }else {
                    result.append(prices[p2] - prices[p1])
                    p1 = p2
                    p2 += 1
                }
            }
        }
        if prices[p2] - prices[p1] > 0 {
            result.append(prices[p2] - prices[p1])
        }
        result.sort(by: ({$0 > $1}))
        var max = 0
        for i in 0..<k {
            if i < result.count {
                max += result[i]
            }else {
                break
            }
        }
        return max
    }
}
