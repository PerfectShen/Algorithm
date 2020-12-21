//
//  Solution.swift
//  leetcode_746
//
//  Created by fl-226 on 2020/12/21.
//  Copyright © 2020 WS. All rights reserved.
//

/*
10  15  20

0  10
1  15

2  20
3   -

dp(0) = 10
dp(1) = 15

dp(2) = 10

dp(3) = Min(dp(2),dp(1))
dp(n) = Min(dp(i-1),dp(i-2) + cost[i])

for
*/


import Foundation


class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        if cost.count == 1 {
            return cost[0]
        }
        if cost.count == 2 {
            return min(cost[0], cost[1])
        }
               //!
//       n-3 n-2 n-1 n n+1
        var dp_first_1 = 0; //到达n - 2 所需要的最小步骤
        var dp_first_2 = cost[0];
        var dp_second_1 = cost[0]; //到达n - 1 所需要的最小步骤 1不包含 2包含
        var dp_second_2 = cost[1];
        var minStep = 0
        for i in 2..<cost.count {
            let s1 = dp_first_1 + cost[i - 1]
            let s2 = dp_first_2 + cost[i]
            let s3 = dp_second_1 + cost[i]
            let s4 = dp_second_2
            minStep = min(min(min(s1, s2), s3), s4)
//            print("minStep = \(minStep) ---- i =  \(i)")
            dp_first_1 = dp_second_1
            dp_first_2 = dp_second_2
            dp_second_1 = min(min(s4, s1),s2 - cost[i] + cost[i-1])
            dp_second_2 = min(min(s3, s2), s4 + cost[i])
            
        }
        return minStep;
    }
}
