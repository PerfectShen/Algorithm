//
//  Solution1.swift
//  leetcode_1074
//
//  Created by 王燊 on 2020/12/19.
//

import Foundation

// 暴力算法 多次重复计算  时间复杂度过高
class Solution1 {
    
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
        for i in row..<count  {
            for j in col..<tmpCount  {
                result += numSubmatrixSumTargetEndPoint(matrix,target,row,col,i,j);
            }
        }
        return result;
    }
    
    func numSubmatrixSumTargetEndPoint(_ matrix: [[Int]], _ target: Int, _ row: Int, _ col : Int,_ endRow : Int, _ endCol : Int) -> Int {
        var result = 0;
        var sum = 0;
        for i in row...endRow {
            for j in col...endCol {
                sum += matrix[i][j];
            }
        }
        if sum == target {
            result += 1;
        }
        print("起始点:(\(row),\(col))---结束点:(\(endRow),\(endCol))---结果:\(result)");
        return result;
    }
}
