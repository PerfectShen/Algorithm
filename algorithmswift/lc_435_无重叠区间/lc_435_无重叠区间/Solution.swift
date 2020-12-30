//
//  Solution.swift
//  lc_435_无重叠区间
//
//  Created by 王燊 on 2020/12/31.
//



import Foundation

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.count == 0 {
            return 0
        }
        var newIntervals = intervals
        newIntervals.sort {($0[1] < $1[1])}
        var l = newIntervals[0]
        var count = 1
        for i in 1..<newIntervals.count {
            if newIntervals[i][0] >= l[1] {
                l = newIntervals[i]
                count += 1
            }
        }
        return newIntervals.count - count
    }
}
