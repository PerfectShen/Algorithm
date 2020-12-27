//
//  Solution2.swift
//  lc_205_同构字符串
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation
class Solution2 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count != t.count { return false }

    var map = [Character: Character]()
    var set = Set<Character>()
    var idx = s.startIndex
    while idx != s.endIndex {
        let c1 = s[idx]
        let c2 = t[idx]
        if let mapped1 = map[c1] {
            if mapped1 != c2 { return false }
        } else {
            map[c1] = c2
            set.insert(c2)
            if map.keys.count != set.count { return false }
        }

        idx = s.index(after: idx)
    }

    return true
}

}

extension String {
    subscript(i: Int) -> Character {
        let index = self.index(startIndex, offsetBy: i)
        return self[index]
    }
}
