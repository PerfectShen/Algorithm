//
//  Solution.swift
//  lc_387_字符串中的第一个唯一字符
//
//  Created by fl-226 on 2020/12/23.
//  Copyright © 2020 WS. All rights reserved.
//

import Foundation

class Solution {
    
    func firstUniqChar(_ s: String) -> Int {
        
        var map = [String:Int]()
        var index = 0
        for tmp in s {
            let key = String(tmp)
            let times = map[key]
            map[key] = (times ?? 0) + 1
            index += 1
        }
        
        index = 0
        for tmp in s {
            let key = String(tmp)
            if map[key] == 1 {
                return index
            }
            index += 1
        }
        return -1

    }
//    func firstUniqChar(_ s: String) -> Int {
//
//        var map = [String:[Int]]()
//        var index = 0
//        for tmp in s {
//            let key = String(tmp)
//            var array = map[key]
//            if array == nil {
//                array = [0,-1]
//            }
//            array![0] += 1
//            if array![1] == -1 {
//                array![1] = index
//            }
//            map[key] = array
//            index += 1
//        }
//
//        var minIndex = -1
//        for key in map.keys {
//            let array = map[key]
//            if array![0] == 1 {
//                if minIndex == -1 {
//                    minIndex = array![1]
//                }else {
//                    minIndex = min(minIndex, array![1])
//                }
//            }
//        }
//        return minIndex
//    }
    
    
    
}
