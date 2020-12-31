//
//  Solution.swift
//  lc_605_种花问题
//
//  Created by 王燊 on 2021/1/1.
//

import Foundation

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0  {return true}
        var newFlowerbed = flowerbed
        newFlowerbed.insert(0, at: 0)
        newFlowerbed.append(0)
        var i = 0
        var count = 0
        while i + 2 < newFlowerbed.count {
            if newFlowerbed[i] == 0 && newFlowerbed[i + 1] == 0 && newFlowerbed[i + 2] == 0 {
                newFlowerbed[i + 1] = 1
                i += 2
                count += 1
            }else {
                i += 1
            }
        }
        return count >= n ? true : false
    }
}
