//
//  main.swift
//  leetcode_746
//
//  Created by fl-226 on 2020/12/21.
//  Copyright © 2020 WS. All rights reserved.
//

//746. 使用最小花费爬楼梯  (简单)

/*
 数组的每个索引作为一个阶梯，第 i个阶梯对应着一个非负数的体力花费值 cost[i](索引从0开始)。

 每当你爬上一个阶梯你都要花费对应的体力花费值，然后你可以选择继续爬一个阶梯或者爬两个阶梯。

 您需要找到达到楼层顶部的最低花费。在开始时，你可以选择从索引为 0 或 1 的元素作为初始阶梯。

 示例 1:

 输入: cost = [10, 15, 20]
 输出: 15
 解释: 最低花费是从cost[1]开始，然后走两步即可到阶梯顶，一共花费15。
  示例 2:

 输入: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
 输出: 6
 解释: 最低花费方式是从cost[0]开始，逐个经过那些1，跳过cost[3]，一共花费6。
 注意：

 cost 的长度将会在 [2, 1000]。
 每一个 cost[i] 将会是一个Integer类型，范围为 [0, 999]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-cost-climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


import Foundation

let solution = Solution();
//          1    1
let nums = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
    //[0,0,1,1]
    //[10, 15, 20]

// dp1 1     dp2  1
// dp1 100   dp2  2
// dp1 100   dp2  2

//[1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
// dp_f 1
// dp_s 100 dp_f + c[i] cmp dp_s
//  dp_s = dp_f + c[i]
// dp_f = sec

    //[1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
    //[10, 15, 20]
print(solution.minCostClimbingStairs(nums))
