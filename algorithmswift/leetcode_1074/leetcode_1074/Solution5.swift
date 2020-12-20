//
//  Solution5.swift
//  leetcode_1074
//
//  Created by 王燊 on 2020/12/19.
//

import Foundation


class Solution5 {
    
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        
        if matrix.count == 0 {
            return 0;
        }
        let rowCount = matrix.count;
        let colCount = Array(matrix[0]).count;
        var result = 0;
        
        
        for i in 0..<rowCount {
            var sumMatrix = [Int](repeating: 0, count: colCount)
            for j in i..<rowCount {
                var tmpSum = 0;
                var map = [Int:Int]()
                map[0] = 1;
                for k in 0..<colCount {
                    sumMatrix[k] += matrix[j][k];
                    tmpSum += sumMatrix[k];
                    
                    result += map[Int(tmpSum-target)] ?? 0;
                    var t = Int(map[tmpSum] ?? 0);
                    t += 1;
                    map[tmpSum] = t;
                    
                }
            }
        }
        return result;
    }
}
