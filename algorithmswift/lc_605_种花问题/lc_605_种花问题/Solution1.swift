//
//  Solution1.swift
//  lc_605_种花问题
//
//  Created by 王燊 on 2021/1/1.
//

import Foundation

class Solution1 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0  {return true}
        var newflowerbed = [0]
        newflowerbed.append(contentsOf: flowerbed)
        newflowerbed.append(0)
        var i = 0
        var count = 0
        while i + 2 < newflowerbed.count {
            if newflowerbed[i] == 0 && newflowerbed[i + 1] == 0 && newflowerbed[i + 2] == 0 {
                newflowerbed[i + 1] = 1
                i += 2
                count += 1
            }else {
                i += 1
            }
        }
        return count >= n ? true : false
    }
}
