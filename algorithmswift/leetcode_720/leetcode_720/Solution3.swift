//
//  Solution3.swift
//  leetcode_720
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation
class Solution3 {
    func longestWord(_ words: [String]) -> String {
        var operationWords = words
        operationWords.sort()
        var record = [String]()
        var result = ""
        
        for word in operationWords {
            let subWord = word.prefix(word.count - 1)
            if record.contains(String(subWord)) == true || subWord.count == 0 {
                if word.count > result.count {
                    result = word
                }
                record.append(word)
            }
        }
        return result
    }
        
}


