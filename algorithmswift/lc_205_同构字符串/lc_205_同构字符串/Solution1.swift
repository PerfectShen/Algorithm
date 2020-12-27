//
//  Solution1.swift
//  lc_205_同构字符串
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation

class Solution1 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict: [Character: Character] = [:]
        for (sChar, tChar) in zip(s, t) {

            if let expect = dict[sChar] {
                guard expect == tChar else { return false }
            }else {
                guard !dict.values.contains(tChar) else { return false }
                dict[sChar] = tChar
            }
        }
        return true
    }
}
