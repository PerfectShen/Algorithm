//
//  Solution.swift
//  lc_42_接雨水
//
//  Created by 王燊 on 2020/12/26.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count == 0 {return 0}
        if height.count < 3 {return 0}
        var stack = [Int]()
        var totalCount = 0
        for i in 0..<height.count {
            while stack.count != 0 && height[i] > height[stack.last!]   {
                let last = stack.removeLast()
                if stack.count != 0 {
                    let minH = min(height[stack.last!], height[i])
                    totalCount += ((minH - height[last]) * (i - stack.last! - 1))
                    print(totalCount)
                }
            }
            stack.append(i)
        }
        return totalCount
    }
}
