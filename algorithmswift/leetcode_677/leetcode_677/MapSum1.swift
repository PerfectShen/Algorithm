//
//  MapSum1.swift
//  leetcode_677
//
//  Created by 王燊 on 2020/12/21.
//

import Foundation

class MapSum1 {

    var map : Dictionary<String, Int>
    
    /** Initialize your data structure here. */
    init() {
        self.map = [String:Int]()
//        Array
//        Dictionary
//        ListFormatter
    }
    
    func insert(_ key: String, _ val: Int) {

        map[key] = val
    }
    
    func sum(_ prefix: String) -> Int {
        
        var sum = 0
        for key in map.keys {
            if key.hasPrefix(prefix) {
                sum += map[key]!
            }
        }
        return sum
    }
}
