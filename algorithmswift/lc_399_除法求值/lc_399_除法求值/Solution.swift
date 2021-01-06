//
//  Solution.swift
//  lc_399_除法求值
//
//  Created by fl-226 on 2021/1/6.
//  Copyright © 2021 WS. All rights reserved.
//

import Foundation

class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var map = [String:[String:Double]]()
        var res = [Double]()
        for i in 0..<equations.count {
            let tmps1 = equations[i][0]
            let tmps2 = equations[i][1]
            let tmpV = values[i]
            if map[tmps1] != nil {
                var sub = map[tmps1]
                sub![tmps2] = tmpV
                map[tmps1] = sub
            }else {
                var sub = [String:Double]()
                sub[tmps2] = tmpV
                map[tmps1] = sub
            }
            if map[tmps2] != nil {
                var sub = map[tmps2]
                sub![tmps1] = 1/tmpV
                map[tmps2] = sub
            }else {
                var sub = [String:Double]()
                sub[tmps1] = 1/tmpV
                map[tmps2] = sub
            }
        }
//        print(map)
        for q in queries {
            if let subMap1 = map[q[0]] , let _ = map[q[1]]  {
                var didChecks = [String]()
                var stack = [[String:Double]]()
                stack.append(subMap1)
                didChecks.append(q[0])
                var paths = [String]()
                paths.append(q[0])
                var isSuccess = false
                while stack.count > 0 {
                    let oMap = stack.last
                    var keyCount = 0
                    for key in oMap!.keys {
                        if key == q[1] {
                            // 可计算
                            paths.append(key)
                            stack.removeAll()
                            isSuccess = true
                            break
                        }else {
                            keyCount += 1
                            if !didChecks.contains(key) {
                                didChecks.append(key)
                                if let nextMap = map[key] {
                                    stack.append(nextMap)
                                    paths.append(key)
                                    break
                                }else {
                                    stack.removeLast()
                                    paths.removeLast()
                                }
                            }else {
                                if (keyCount >= oMap!.keys.count) {
                                    paths.removeLast()
                                    stack.removeLast()
                                }
                            }
                        }
                    }
                }
                if isSuccess {
                    var result = 1.0
                    for i in 0..<paths.count - 1 {
                        let tmpMap = map[paths[i]]
                        let tmpV = tmpMap![paths[i + 1]]
                        result *= tmpV!;
                    }
                    res.append(result)
                }else {
                    res.append(-1.0)
                }
            }else {
                res.append(-1.0)
            }
        }
        return res
    }
}
