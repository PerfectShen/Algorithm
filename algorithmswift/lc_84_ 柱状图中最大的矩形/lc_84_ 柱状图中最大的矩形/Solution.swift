//
//  Solution.swift
//  lc_84_ 柱状图中最大的矩形
//
//  Created by 王燊 on 2020/12/26.
//


// 使用栈
// 42 739 496  316 901 402 581
import Foundation

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 0 {return 0}
        if heights.count == 1 {return heights[0]}
        var newHeights = [Int]()
        for i in 0..<(heights.count + 2) {
            if i == 0 || i == heights.count + 1{
                newHeights.append(0)
            }else {
                newHeights.append(heights[i - 1])
            }
        }
        var stack = [Int]()
        var maxArea = 0
        stack.append(newHeights[0])
        for i in 1..<newHeights.count {
            while newHeights[i] < newHeights[stack.last!] {
                let tmpHeight = newHeights[stack.removeLast()]
                maxArea = max(maxArea, tmpHeight * (i - stack.last! - 1))
            }
            stack.append(i)
        }
        
        return maxArea
    }
}
