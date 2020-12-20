//
//  Solution2.swift
//  leetcode_1074
//
//  Created by 王燊 on 2020/12/19.
//

// 使用迭代
/*
 首先计算出 一某个[row][col] 为起点   [endrow][endcol]为终点矩阵和 并保存
 有公式  sum[i][j] = sum[i-1][j] + (m[i][j] +... m[0][j]) i > 0 , j> 0 ,(m[i][j] +... m[0][j]) 为第i行 0 加到 位置
        sum[i][j] = sum[i - 1][j] , i > 0 , j = 0
        sum[i][j] = sum[i][j-1] + m[i][j], i = 0 , j > 0
        sum[i][j] =  m[i][j], i = 0 , j = 0
       
*/
import Foundation

class Solution2 {
    
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        
        var result = 0;
        let count = matrix.count;
        for i in 0..<count {
            let tmpArray = Array(matrix[i]);
            let tmpCount = tmpArray.count;
            for j in 0..<tmpCount {
                let tmpResult = self.numSubmatrixSumTargetPoint(matrix,target,i,j);
                result += tmpResult;
            }
        }
        return result;
    }
    
    func numSubmatrixSumTargetPoint(_ matrix: [[Int]], _ target: Int, _ row: Int, _ col : Int) -> Int {
        var result = 0;
        let count = matrix.count;
        let tmpArray = Array(matrix[row]);
        let tmpCount = tmpArray.count;
        var sumMatrix = [[Int]](repeating: [Int](repeating: -100, count: tmpCount - col), count: count - row);
        
        for i in row..<count  {
            var sum_i = 0;  //第i行的和
            for j in col..<tmpCount  {
                sum_i += matrix[i][j];
                if i == row && j == col {
                    sumMatrix[i - row][j - col] = matrix[i][j];
                }else if i > row && j == col{
                    sumMatrix[i - row][j - col] = sumMatrix[i - 1 - row][j - col] + matrix[i][j];
                }else if i == row && j > col {
                    sumMatrix[i - row][j - col] = sumMatrix[i - row][j - 1 - col] + matrix[i][j];
                }else {
                    sumMatrix[i - row][j - col] = sumMatrix[i - 1 - row][j - col] + sum_i;
                    
                }
                if sumMatrix[i - row][j - col] == target {
                    result += 1;
                }
            }
        }
        print("和矩阵\(sumMatrix)");
        return result;
    }

}
