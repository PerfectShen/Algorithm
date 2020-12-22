//
//  Solution.swift
//  lc_1637_两点之间不包含任何点的最宽垂直面积
//
//  Created by fl-226 on 2020/12/22.
//  Copyright © 2020 WS. All rights reserved.
//

import Foundation

// 排序 - 再遍历  排序算法n - nlogn左右 总的应该是n^2 - n^2logn
class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        var oPoints = points;
        // 升序排序
        oPoints.sort { (p1 : [Int] , p2 : [Int])  -> Bool in
            if p1[0] < p2[0] {
                return true
            }else {
                return false
            }
        }
        
        var maxWidth = oPoints[1][0] - oPoints[0][0];
        for i in 2..<oPoints.count {
            let tmpMax =  oPoints[i][0] -  oPoints[i - 1][0]
            if maxWidth < tmpMax {
                maxWidth = tmpMax
            }
        }
        return maxWidth
    }
}
