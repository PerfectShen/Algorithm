//
//  Solution.swift
//  lc_85_最大矩形
//
//  Created by 王燊 on 2020/12/26.
//

import Foundation

// 暴力算法 有很多重复计算 超时
class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        let colCount = matrix[0].count
        if colCount == 0 {
            return 0
        }
        var maxCount = 0
        for row in 0..<matrix.count {
            for col in 0..<colCount {
                if matrix[row][col].wholeNumberValue == 1 {
                    maxCount = max(maxCount, maximalRectanglePoint(matrix,colCount,row,col))
                }
            }
        }
        
        return maxCount
    }
    
    func maximalRectanglePoint(_ matrix : [[Character]],_ colCount : Int, _ row : Int , _ col : Int) -> Int {
        var maxCount = 1
        // 计算横排最大面积
        var m = row
        var maxN = colCount
        for i in row..<matrix.count {
            m = i
            for j in col..<colCount {
                if j < maxN {
                    if matrix[i][j].wholeNumberValue == 0 {
                        maxN = j
                        break
                    }
                }
            }
           let tmpCount = (m - row + 1) * (maxN - col)
           maxCount = max(tmpCount, maxCount)
        }
//        print("[\(row),\(col)]最大为\(maxCount) -- m = \(m) --maxN = \(maxN)")
        return maxCount
    }
}

