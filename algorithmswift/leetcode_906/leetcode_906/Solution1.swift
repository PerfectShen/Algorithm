//
//  Solution1.swift
//  leetcode_906
//
//  Created by 王燊 on 2020/12/20.
//

// 解题 思路
/*
 1. 构造R到L范围内的回文数 数字范围总长为10 ^ 18,平方根范围为 10^9. 回文数特点为收尾依次对称. 所以一个10^9范围内的任何一个回文数,可以有 10^5范围中的数字拼接而成. 比如 1234 可拼接为 1234321 12344321 (长度为奇数或者偶数)))
 2. 可得思路 在0 - 10^5 范围内枚举所有的"回文数的一半",并将此回文数一半拼接为 回文数,求平方 范围在 R-L范围内并保存在数组中
 3. 遍历数组检查元素是否是回文数. 数组中回文数的个数即结果.
 */

import Foundation

class Solution1 {
    func superpalindromesInRange(_ L: String, _ R: String) -> Int {
        guard let l = Int64(L) else { return 0 }
        guard let r = Int64(R) else { return 0 }
        var array = [Int64]();
        let maxCount = 100000;

        for i in 1...maxCount {
            let tmpArray = self.createMoslems(i);
            let first = tmpArray[0]
            let second = tmpArray[1]
            
            var sqrF = Int64(0)
            if first <= 1000000000  {
                sqrF = first * first
            }
            var sqrS = Int64(0)
            if second <= 1000000000 {
                sqrS  = second * second
            }
            
            if sqrF >= l && sqrF <= r {
                array.append(sqrF)
            }
            if sqrS >= l && sqrS <= r {
                array.append(sqrS)
            }
            if sqrF > r {
                break
            }
        }
        var result = 0;
        for tmpNum in array {
            let isMoslems = self.checkIsMoslems(tmpNum)
            if isMoslems {
                print("回文数\(tmpNum)")
                result += 1
            }
            
        }
        return result
    }
    
    func createMoslems(_ num : Int) -> [Int64] {
        var checkArray =  [Int]()
        var tmpN = num;
        while tmpN > 0 {
            checkArray.append(Int(tmpN%10))
            tmpN /= 10
        }
        var resultArray = [Int64]()
        if num < 10 {
            resultArray.append(Int64(num))
        }
        var moslems = 0;
        var mi = 1;
        for i in 0..<checkArray.count {
            moslems = moslems +  mi * checkArray[checkArray.count - i - 1];
            mi = mi * 10;
            if i == checkArray.count - 1 {
                let  tmpMoslems =  moslems + Int(num) * mi;
                resultArray.append(Int64(tmpMoslems))
            }
            if i == checkArray.count - 2 {
                let tmpMoslems =  moslems + Int(num) * mi;
                resultArray.append(Int64(tmpMoslems))
            }
        }
        return resultArray;
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
