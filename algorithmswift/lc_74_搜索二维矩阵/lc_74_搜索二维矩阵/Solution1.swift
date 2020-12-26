//
//  Solution1.swift
//  lc_74_搜索二维矩阵
//
//  Created by 王燊 on 2020/12/26.
//

import Foundation


class Solution1 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        
        var top = 0
        var bottom = matrix.count - 1
        while bottom >= top {
            let mid = (top + bottom) >> 1
            if matrix[mid][0] == target {
                return true
            }else if matrix[mid][0] > target {
                bottom = mid - 1
            }else {
                top = mid + 1
            }
        }
        if top > 0 {
            top -= 1
        }
        let array = matrix[top]
        var left = 0
        var right = array.count - 1
        while right >= left {
            let mid = (right + left) >> 1
            if array[mid] == target {
                return true
            }else if array[mid] > target {
                right = mid - 1
            }else {
                left = mid + 1
            }
        }
        return false
    }
}
