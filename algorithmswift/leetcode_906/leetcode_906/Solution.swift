//
//  Solution.swift
//  leetcode_906
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation

class Solution {
    func superpalindromesInRange(_ L: String, _ R: String) -> Int {
        
        guard let l = Int64(L) else { return 0 }
        guard let r = Int64(R) else { return 0 }
        var array = [Int64]();
        for _ in 0...r {
            array.append(0)
        }
        for i in 1...r {
            let sqrI = i * i;
            let isMoslems = checkIsMoslems(i)

            var tmp = array[Int(i)]
            if isMoslems == true {
                tmp += 1
                
            }
            
            array[Int(i)] = tmp
            if sqrI <= r {
                var tmpSqr = array[Int(sqrI)]
                tmpSqr += 1;
                if isMoslems {
                    tmpSqr += 1
                }
                array[Int(sqrI)] = tmpSqr
            }
        }
        
        var result = 0;
        for i in  0..<array.count {
            if array[i] >= 3 && i >= l {
                print("超级回文\(i) --- array[i] = \(array[i])")
                result += 1
            }
        }
        return result
    }
    
    
    func checkIsMoslems(_ num : Int64) -> Bool {
        var checkArray =  [Int]()
        var tmpN = num;
        
        while tmpN > 0 {
            checkArray.append(Int(tmpN%10))
            tmpN /= 10
        }
        for i in 0...checkArray.count/2 {
            if checkArray[i] != checkArray[checkArray.count - i - 1] {
                return false
            }
        }
        return true;
    }
}
