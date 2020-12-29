//
//  Solution.swift
//  lc_739_每日温度
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        if T.count == 1 {return [0]}
        var results = [Int](repeating: 0, count: T.count)
        var stack = [Int]()
        for i in 0..<T.count {
            while stack.count != 0 && T[i] > T[stack.last!]  {
                let last = stack.removeLast()
                results[last] = i - last
            }
            stack.append(i)
        }
        return results
    }
}
