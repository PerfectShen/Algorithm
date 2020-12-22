//
//  Solution1.swift
//  lc_1637_两点之间不包含任何点的最宽垂直面积
//
//  Created by fl-226 on 2020/12/22.
//  Copyright © 2020 WS. All rights reserved.
//

import Foundation

class Solution1 {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        var array = [Int]()
        for i in 0..<points.count {
            array.append(points[i][0])
        }
        array.sort()
        var maxWidth = array[1] - array[0]
        for i in 2..<array.count {
            let tmpMax = array[i] - array[i - 1]
            if maxWidth < tmpMax {
                maxWidth = tmpMax
            }
        }
        return maxWidth
    }
}
