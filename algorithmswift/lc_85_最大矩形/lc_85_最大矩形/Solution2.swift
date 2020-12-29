//
//  Solution2.swift
//  lc_85_最大矩形
//
//  Created by 王燊 on 2020/12/26.
//

import Foundation

// 先求出当前行以某个点为结尾的 连续为1的最大个数 并保存在数组中
// 可以遍历每个点 计算以这个点为结尾的矩形面积  时间复杂度 O(m^2 * n)
class Solution2 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        let colCount = matrix[0].count
        if colCount == 0 {
            return 0
        }
        
        var sumCol = [[Int]]() //以每个点为结尾前面连续为1的数量
        for i in 0..<matrix.count {
            var tmpSum = [Int]()
            for j in 0..<colCount {
                if j == 0 {
                    tmpSum.append(matrix[i][j].wholeNumberValue!)
                }else {
                    if matrix[i][j].wholeNumberValue == 0 {
                        tmpSum.append(0)
                    }else {
                        let sum = tmpSum[j - 1] + 1
                        tmpSum.append(sum)
                    }
                }
            }
            sumCol.append(tmpSum)
        }
        var maxCount = 0
        for i in 0..<matrix.count {
            for j in 0..<colCount {
                if sumCol[i][j] > 0 {
                    if i == 0 {
                        maxCount = max(sumCol[i][j], maxCount)
                    }else {
                        
                        let width = sumCol[i][j]
                        var tmpMax = width
                        var tmpWidth = width
                        var m = i - 1
                        while m >= 0 {
                           tmpWidth = min(sumCol[m][j], tmpWidth)
                            if tmpWidth == 0 {
                                break
                            }
                           tmpMax = max(tmpWidth * (i - m + 1), tmpMax)
                            m = m - 1
                        }
                        maxCount = max(tmpMax, maxCount)
                        
                    }
                }
            }
        }
        return maxCount
    }
}
