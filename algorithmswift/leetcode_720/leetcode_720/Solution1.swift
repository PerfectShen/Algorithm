//
//  Solution1.swift
//  leetcode_720
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation

class Solution1 {
    func longestWord(_ words: [String]) -> String {
        
        var indexMap = [Int : [String]]()
        var maxLen = 0
        for i in 0..<words.count {
            let currlength = words[i].count
            var subArray = indexMap[currlength]
            if subArray == nil {
                subArray = [String]()
            }
            subArray!.append(words[i])
            indexMap[currlength] = subArray
            maxLen = max(words[i].count, maxLen)
        }
        
        var maxStringArray = [String]()
        var currMaxLength = maxLen;
        while maxLen > 0 {
            let k = maxLen
            let array = indexMap[k]
            if array == nil || array!.count == 0 {
                if k != 0 {
                    maxStringArray.removeAll()
                }
                maxLen -= 1;
                continue
            }
            if maxStringArray.count == 0 {
                maxStringArray = array ?? [String]();
                currMaxLength = maxLen
                maxLen -= 1;
                continue
            }
            let tmpMaxStringArray = maxStringArray
            for j in 0..<tmpMaxStringArray.count {
                let m = tmpMaxStringArray.count - 1 - j
                let tmpWord = tmpMaxStringArray[m]
                
                var hasPrefix = false
                for tmpsubWord in array! {
                    if tmpWord.hasPrefix(tmpsubWord) == true {
                        hasPrefix = true
                        break
                    }
                }
                if hasPrefix == false {
                    maxStringArray.remove(at: m)
                }
            }
            if maxStringArray.count == 0 {
                maxLen = currMaxLength - 1;
            }else {
                maxLen -= 1
            }
        }
        
        if maxStringArray.count > 0 {
            maxStringArray.sort { (s1 : String, s2 : String) -> Bool in
                if s1.compare(s2) == ComparisonResult.orderedAscending {
                    return true
                }else {
                    return false
                }
            }
            return maxStringArray.first!;
        }else {
            return ""
        }
    }
}
