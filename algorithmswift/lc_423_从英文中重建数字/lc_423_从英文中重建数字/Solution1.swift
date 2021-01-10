//
//  Solution1.swift
//  lc_423_从英文中重建数字
//
//  Created by 王燊 on 2021/1/10.
//

import Foundation
class Solution1 {
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
            let tmpMap = map[tmpStr]
            if i == 3 || i == 7 {
                if tmpStr.count == tmpMap!.count + 1 && tmpMap!["e"]! >= 2  {
                    resultString.append("\(i)")
                }
            }else if i == 9 {
                if tmpStr.count == tmpMap!.count + 1 && tmpMap!["n"]! >= 2  {
                    resultString.append("\(i)")
                }
            }else {
                if tmpStr.count == tmpMap!.count {
                    resultString.append("\(i)")
                }
            }
            
        }
        return resultString
    }
}
