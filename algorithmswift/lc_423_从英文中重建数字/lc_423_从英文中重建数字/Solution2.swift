//
//  Solution2.swift
//  lc_423_从英文中重建数字
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation

class Solution2 {
    func originalDigits(_ s: String) -> String {
        var map = [String:Int]()
        for subS in s {
            let key = String(subS)
            if let count = map[key] {
                map[key] = count + 1
            }else {
                map[key] = 1
            }
        }
//        ["zero","one","two","three","four","five","six","seven","eight","nine"];
        // "z"的个数就是0的个数
        // "w"的个数就是2的个数
        // "u"的个数就是4的个数
        // "x"的个数就是6的个数
        // "g"的个数就是8的个数
        let zero_count = map["z"] ?? 0
        let two_count = map["w"] ?? 0
        let four_count = map["u"] ?? 0
        let six_count = map["x"] ?? 0
        let eight_count = map["g"] ?? 0
        
        // 5的个数为 "f"的个数 - four_count
        let f_count = map["f"] ?? 0
        let five_count = f_count - four_count
        // 7的个数为 "v"的个数 - five_count
        let v_count = map["v"] ?? 0
        let seven_count = (v_count - five_count)
        // 3的个数为 "h"的个数 - eight_count
        let h_count = map["h"] ?? 0
        let three_count = (h_count - eight_count)
        // 1的个数未 "o"的个数 - zero_count - two_count - four_count
        let o_count = map["o"] ?? 0
        let one_count = (o_count - zero_count - two_count - four_count)
        // 9的个数为 "i"的个数 - five_count - six_count - eight_count
        let i_count = map["i"] ?? 0
        let nine_count = (i_count - five_count - six_count - eight_count)
        
        let list = [zero_count,one_count,two_count,three_count,four_count,five_count,six_count,seven_count,eight_count,nine_count]
        var resultString = ""
        for i in 0..<list.count {
            var tmpCount = list[i]
            while tmpCount > 0 {
                resultString.append("\(i)")
                tmpCount -= 1
            }
        }
        return resultString
    }
}
