//
//  Solution1.swift
//  leetcode_121
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation
class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {

        if prices.count == 0 {
            return 0
        }
        
        var minPrice = prices[0]
        var maxPrice = 0
        for i in 1..<prices.count {
            if minPrice > prices[i] {
                minPrice = prices[i]
            }else {
                let tmp = prices[i] - minPrice
                maxPrice = max(tmp, maxPrice)
            }
        }
        return maxPrice
        
    }
}

