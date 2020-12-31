//
//  Solution2.swift
//  lc_605_种花问题
//
//  Created by 王燊 on 2021/1/1.
//

import Foundation
class Solution2 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 1
        var newN = n;
        for f in flowerbed {
            if f == 1 {
                if count > 2 {
                    newN -= (count - 1)/2
                }
                count = 0
            }else {
                count += 1
            }
        }
        newN -= count
        return newN <= 0
    }
}
