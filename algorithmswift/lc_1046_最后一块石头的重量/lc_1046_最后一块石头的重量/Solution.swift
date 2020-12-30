//
//  Solution.swift
//  lc_1046_最后一块石头的重量
//
//  Created by 王燊 on 2020/12/30.
//

import Foundation

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        if stones.count == 0 {return 0}
        if stones.count == 1 {return stones[0]}
        var newStones = stones
        newStones.sort()
        var count = newStones.count
        while count > 1 {
            let last = newStones.removeLast()
            let sesondLast = newStones.removeLast()
            newStones.append(abs(sesondLast - last))
            newStones.sort()
            count -= 1
        }
        return newStones[0]
    }
}
