//
//  Solution4.swift
//  leetcode_1074
//
//  Created by 王燊 on 2020/12/19.
//

import Foundation


class Solution4 {
    
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        
        var result = 0;
        let count = matrix.count;
        let subCount = Array(matrix[0]).count
        var sumMatrix_0_0 = [[Int]](repeating: [Int](repeating: 0, count:subCount), count: count);
        for i in 0..<count {
            var sum_i = 0;  //第i行的和
            for j in 0..<subCount {
                sum_i += matrix[i][j];
                if i == 0 && j == 0 {
                    sumMatrix_0_0[i][j] = matrix[i][j];
                }else if i > 0 && j == 0{
                    sumMatrix_0_0[i][j] = sumMatrix_0_0[i - 1][j] + matrix[i][j];
                }else if i == 0 && j > 0 {
                    sumMatrix_0_0[i][j] = sumMatrix_0_0[i][j - 1] + matrix[i][j];
                }else {
                    sumMatrix_0_0[i][j] = sumMatrix_0_0[i - 1][j] + sum_i;
                }
            }
        }
        //(row,col) -> (i,j)等价于 (0,0)->(i,j) - (i,j)->(i,col-1) - (0,0)->(row-1,j) + (row-1,col-1);  边界情况自行判断一下
        for row in 0..<count {
            for col in 0..<subCount {
                for i in row..<count  {
                    for j in col..<subCount  {
                        var tmpSum = -1
                        if row == 0 && col == 0 {
                            tmpSum = sumMatrix_0_0[i][j]
                        }else if row == 0 && col != 0 {
                            tmpSum = sumMatrix_0_0[i][j] - sumMatrix_0_0[i][col-1]
                        }else if row != 0 && col == 0 {
                            tmpSum = sumMatrix_0_0[i][j] - sumMatrix_0_0[row-1][j]
                        }else if row != 0 && col != 0 {
                            tmpSum = sumMatrix_0_0[i][j] - sumMatrix_0_0[row-1][j] - sumMatrix_0_0[i][col-1] + sumMatrix_0_0[row-1][col-1]
                        }
                        if tmpSum == target {
                            result += 1
                        }
                    }
                }
            }
        }
        return result;
    }
}
