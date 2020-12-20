//
//  Solution.swift
//  leetcode_1275
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation

class Solution {
    enum Status : String {
        case A = "A"
        case B = "B"
        case Pending = "Pending"
        case Draw = "Draw"
        case X = "X"
        case O = "O"
        
    }
    func tictactoe(_ moves: [[Int]]) -> String {
        if moves.count < 5 {
            return Solution.Status.Pending.rawValue
        }
        var array = [String]()
        for _ in 0..<9 {
            array.append("")
        }
        
        for i in 0..<moves.count {
            let x = moves[i][0]
            let y = moves[i][1]
            
            var tmp = "";
            if i%2 == 0 {
                tmp = Solution.Status.X.rawValue
            }else {
                tmp = Solution.Status.O.rawValue
            }
            array[x * 3 + y] = tmp;
        }

        // 判断行
        for i in 0..<3 {
            let tmpS = array[i * 3 + 0]
            let cmp1 = tmpS.compare(Solution.Status.X.rawValue)
            let cmp2 = tmpS.compare(Solution.Status.O.rawValue)
            if cmp1 != ComparisonResult.orderedSame && cmp2 != ComparisonResult.orderedSame {
                continue
            }
            
            var same = true
            for j in 1..<3 {
                let tmpS1 = array[i * 3 + j]
                if tmpS.compare(tmpS1) != ComparisonResult.orderedSame {
                    same = false
                    break
                }
            }
            if same {
                if cmp1 == ComparisonResult.orderedSame  {
                    return Solution.Status.A.rawValue
                }else {
                    return Solution.Status.B.rawValue
                }
            }
        }
        
        // 判断列
        for i in 0..<3 {
            let tmpS = array[i]
            let cmp1 = tmpS.compare(Solution.Status.X.rawValue)
            let cmp2 = tmpS.compare(Solution.Status.O.rawValue)
            if cmp1 != ComparisonResult.orderedSame && cmp2 != ComparisonResult.orderedSame {
                continue
            }
            
            var same = true
            for j in 1..<3 {
                let tmpS1 = array[j * 3 + i]
                if tmpS.compare(tmpS1) != ComparisonResult.orderedSame {
                    same = false
                    break
                }
            }
            if same {
                if cmp1 == ComparisonResult.orderedSame  {
                    return Solution.Status.A.rawValue
                }else {
                    return Solution.Status.B.rawValue
                }
            }
        }
        
        // 判断对角线 左上
        do {
            let tmpS = array[0]
            let cmp1 = tmpS.compare(Solution.Status.X.rawValue)
            let cmp2 = tmpS.compare(Solution.Status.O.rawValue)
            if cmp1 == ComparisonResult.orderedSame || cmp2 == ComparisonResult.orderedSame {
                var same = true
                for j in 0..<9 {
                    if j/3 == j%3 {
                        let tmpS1 = array[j]
                        if tmpS.compare(tmpS1) != ComparisonResult.orderedSame {
                            same = false
                            break
                        }
                    }
                }
                if same {
                    if cmp1 == ComparisonResult.orderedSame  {
                        return Solution.Status.A.rawValue
                    }else {
                        return Solution.Status.B.rawValue
                    }
                }
            }
        }
        
        // 判断对角线 右上
        do {
            let tmpS = array[2]
            let cmp1 = tmpS.compare(Solution.Status.X.rawValue)
            let cmp2 = tmpS.compare(Solution.Status.O.rawValue)
            if cmp1 == ComparisonResult.orderedSame || cmp2 == ComparisonResult.orderedSame {
                var same = true
                for j in 0..<9 {
                    if j == 4 || j == 6  {
                        let tmpS1 = array[j]
                        if tmpS.compare(tmpS1) != ComparisonResult.orderedSame {
                            same = false
                            break
                        }
                    }
                }
                if same {
                    if cmp1 == ComparisonResult.orderedSame  {
                        return Solution.Status.A.rawValue
                    }else {
                        return Solution.Status.B.rawValue
                    }
                }
            }
        }
        if moves.count < 9 {
            return Solution.Status.Pending.rawValue
        }else {
            return Solution.Status.Draw.rawValue
        }
    }
}
