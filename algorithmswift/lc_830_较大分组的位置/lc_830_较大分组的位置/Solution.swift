//
//  Solution.swift
//  lc_830_较大分组的位置
//
//  Created by fl-226 on 2021/1/5.
//  Copyright © 2021 WS. All rights reserved.
//

import Foundation

class Solution {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        var resultArray = [[Int]]()
        var i = 0
        var j = i + 1
        let array = s.map { $0}
        while i < array.count - 1 && j < array.count {
            if array[i] == array[j] {
                j += 1
            }else if array[i] != array[j] {
                if j - i >= 3 {
                    resultArray.append([i,j-1])
                }
                i = j
                j = i + 1
            }
        }
        if j - i >= 3 {
            resultArray.append([i,j-1])
        }
        return resultArray
    }
}
