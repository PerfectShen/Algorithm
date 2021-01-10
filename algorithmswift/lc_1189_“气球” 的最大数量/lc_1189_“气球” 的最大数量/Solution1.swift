//
//  Solution1.swift
//  lc_1189_“气球” 的最大数量
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

class Solution1 {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var map : [Character:Int] = ["b":0,"a":0,"l":0,"o":0,"n":0]
        for c  in text {
            switch c {
            case "b":
                map["b"]! += 2
            case "a":
                map["a"]! += 2
            case "l":
                map["l"]! += 1
            case "o":
                map["o"]! += 1
            case "n":
                map["n"]! += 2
            default:
                break
            }
        }
        return (map.values.min()!/2)
    }
}
