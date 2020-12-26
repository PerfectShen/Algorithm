//
//  Solution1.swift
//  lc_85_最大矩形
//
//  Created by 王燊 on 2020/12/26.
//

import Foundation
class Solution1 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        let colCount = matrix[0].count
        if colCount == 0 {
            return 0
        }
        // 横向前缀和
        var sumCol = [[Int]]()
        // 纵向矩阵前缀和
        var sumMatrix = [[Int]]()
        for i in 0..<matrix.count {
            var tmpSum = [Int]()
            var tmpMatrix = [Int]()
            for j in 0..<colCount {
                tmpMatrix.append(0)
                if j == 0 {
                    tmpSum.append(matrix[i][j].wholeNumberValue!)
                }else {
                    let sum = tmpSum[j - 1] + matrix[i][j].wholeNumberValue!
                    tmpSum.append(sum)
                }
            }
            sumCol.append(tmpSum)
            sumMatrix.append(tmpMatrix)
        }
        
        for i in 0..<matrix.count  {
            for j in 0..<colCount {
                if i == 0 {
                    sumMatrix[i][j] = sumCol[i][j]
                }else {
                    sumMatrix[i][j] = sumCol[i][j] + sumMatrix[i - 1][j]
                }
            }
        }
        var maxCount = 0
        for row in 0..<matrix.count {
            for col in 0..<colCount {
                for i in row..<matrix.count {
                    for j in col..<colCount {
                        if matrix[row][col].wholeNumberValue == 1 {
                            
                            var sumColRow_1 = 0
                            var sumRow_1 = 0
                            var sumCol_1 = 0
                            if row > 0 && col > 0 {
                                sumColRow_1 = sumMatrix[row - 1][col - 1]
                                sumRow_1 = sumMatrix[row - 1][j]
                                sumCol_1 = sumMatrix[i][col - 1]
                            }else {
                                if row > 0 {
                                    sumRow_1 = sumMatrix[row - 1][j]
                                    sumColRow_1 = 0
                                }else if col > 0 {
                                    sumCol_1 = sumMatrix[i][col - 1]
                                    sumColRow_1 = 0
                                }
                            }
                            let tmp = sumMatrix[i][j] + sumColRow_1 - sumRow_1 - sumCol_1
                            let shouldSum = (i - row + 1) * (j - col + 1)
                            if tmp == shouldSum {
                                print("[\(row),\(col)]最大为\(tmp) -- i = \(i) -- j = \(j)")
                                maxCount = max(tmp, maxCount)
                            }
                        }
                    }
                }
            }
        }
        return maxCount
    }
}

