//
//  Solution.swift
//  lc_423_从英文中重建数字
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation


class Solution {
    func originalDigits(_ s: String) -> String {
        var map = [String:[String:Int]]()
        let numStrs = ["zero","one","two","three","four","five","six","seven","eight","nine"];
        for i in 0...9 {
            let key = numStrs[i]
            let tmpMap = [String:Int]()
            map[key] = tmpMap
        }
        for tmpS in s {
           let tmpKey = String(tmpS)
            for string in numStrs {
                if string.contains(tmpKey) {
                    var tmpMap = map[string]!
                    if tmpMap[tmpKey] == nil {
                        tmpMap[tmpKey] = 1
                    }else {
                        tmpMap[tmpKey]! += 1
                    }
                    map[string] = tmpMap
                }
            }
        }
        var resultString = ""
        for i in 0..<numStrs.count {
            let tmpStr = numStrs[i]
            var tmpMap = map[tmpStr]
            
            var isStop = false
            while !isStop {
                var length = tmpStr.count
                for sub in tmpStr {
                    length -= 1
                    let subKey = String(sub)
                    var count = tmpMap![subKey] ?? 0
                    count -= 1
                    if count < 0 {
                        isStop = true
                        break
                    }else {
                        tmpMap![subKey] = count
                    }
                }
                if length == 0 {
                    resultString.append("\(i)")
                }
            }
        }
        return resultString
    }
}
