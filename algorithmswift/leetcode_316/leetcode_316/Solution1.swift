//
//  Solution1.swift
//  leetcode_316
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation
class Solution1 {
    func removeDuplicateLetters(_ s: String) -> String {
        
        var index = 0;
        var lastIndexMap = [String:Int]()
        var stack = [String]()
        for tmp in s {
            let key = String(tmp)
            lastIndexMap[key] = index
            index += 1
        }
        
        var k = 0
        for tmp in s {
            let key = String(tmp)
            
            if stack.contains(key) {
                k += 1
                continue
            }
            if stack.count > 0 && stack.first!.compare(key) == ComparisonResult.orderedDescending && lastIndexMap[stack.first!]! > k {
                stack.remove(at: 0)
                
                while stack.count > 0 && stack.first!.compare(key) == ComparisonResult.orderedDescending && lastIndexMap[stack.first!]! > k {
                    stack.remove(at: 0)
                }
                
                stack.insert(key, at: 0)
            }else {
                stack.insert(key, at: 0)
            }
            k += 1
        }
        
        var result = String()
        for i in 0..<stack.count {
            let tmpS = stack[stack.count - i - 1];
            result.append(tmpS)
        }
        return result
       
    }
    
}
