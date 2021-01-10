//
//  Solution.swift
//  lc_63_不同路径II
//
//  Created by 王燊 on 2021/1/8.
//

// 动态规划
/*
    如果 o[i,j] == 0, f[i,j] = f[i-1,j] + f[i,j-1] , 如果 o[i,j] == 1, f[i,j] = 0
    初始值 f[0,0] = 0  f[0,j] = j  f[i,0] = i
    
 
 */
import Foundation
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count == 0 {return 0 }
        let firstNums = obstacleGrid[0]
        if firstNums.count == 0 {return 0}
        let colCount = firstNums.count
        var paths = [[Int]](repeating: [Int](repeating: 0, count: colCount), count: obstacleGrid.count)
        for i in 0..<obstacleGrid.count {
            for j in 0..<colCount {
                if obstacleGrid[i][j] == 1 {
                    paths[i][j] = 0
                }else {
                    if i == 0 && j == 0 {
                        paths[i][j] = 1
                    }else if i == 0 && j != 0  {
                        paths[i][j] = paths[i][j - 1]
                    }else if i != 0 && j == 0 {
                        paths[i][j] = paths[i - 1][j]
                    }else {
                        paths[i][j] = paths[i - 1][j] + paths[i][j - 1]
                    }
                }
            }
        }
        return paths[obstacleGrid.count - 1][firstNums.count - 1];
    }
}
