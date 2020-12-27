//
//  Solution.swift
//  lc_205_同构字符串
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation


class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {return false}
        var map1: [Character: Character] = [:]
        var map2: [Character: Character] = [:]
        for (sChar,tChar) in zip(s, t) {
            if map1[sChar] == nil {
                if map2[tChar] == nil {
                    map1[sChar] = tChar
                    map2[tChar] = sChar
                }else {
                    return false
                }
            }else {
                if map1[sChar] != tChar {
                    return false
                }
            }
        }
        return true
    }
}
