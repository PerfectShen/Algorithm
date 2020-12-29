//
//  Solution.swift
//  lc_74_搜索二维矩阵
//
//  Created by 王燊 on 2020/12/25.
//

import Foundation


class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        
        for row in 0..<matrix.count {
            if matrix[row].count == 0 {
                return false
            }
            if matrix[row][0] == target {
                return true
            }else if row == 0 && matrix[row][0] > target {
                return false
            }else {
                if matrix[row][0] < target  {
                    if (row + 1 < matrix.count && matrix[row + 1][0] > target) || row == matrix.count - 1 {
                        let subArray = matrix[row]
                        for col in 1..<subArray.count {
                            if subArray[col] == target {
                                return true
                            }
                        }
                        return false
                    }
                }else {
                    continue
                }
            }
        }
        return false
    }
}


/*
 if matrix.count == 0 {
     return false
 }
 
 var row = (matrix.count - 1) >> 1
 var top = 0
 var bottom = matrix.count - 1
 while row >= 0 && row < matrix.count  {
     if matrix[row][0] > target {
         bottom = row
         row = (row + top) >> 1
     }else if (matrix[row][0] == target){
         return true
     }else {
         if (row + 1 < matrix.count && matrix[row + 1][0] > target) || row + 1 >= matrix.count  {
             let subArray = matrix[row]
             
             for num in subArray {
                 if num == target {
                     return true
                 }
             }
             return false
//                    let colCount = subArray.count
//                    var col = (colCount - 1) >> 1
//                    var left = 0
//                    var right = colCount - 1
//                    while col >= 0 && col < colCount && right - left >= 1  {
//                        if subArray[col] > target {
//                            left = col
//                            col = (right + col) >> 1
//                            if col == left {
//                                return false
//                            }
//                        }else if subArray[col] < target {
//                            right = col
//                            col = (col + left) >> 1
////                            if col == right {
////                                return false
////                            }
//                        }else {
//                            return true
//                        }
//                    }
//                    return false
             
         }else {
             top = row
             row = (row + bottom) >> 1
         }
     }
 }
 return false
 */
