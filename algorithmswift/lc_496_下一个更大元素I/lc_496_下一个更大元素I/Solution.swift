//
//  Solution.swift
//  lc_496_下一个更大元素I
//
//  Created by 王燊 on 2020/12/27.
//

import Foundation
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums2.count == 0 {return []}
        if nums2.count == 1 {return [-1]}
        var stack = [Int]()
        var map = [Int:Int]()
        for i in 0..<nums2.count {
            while stack.count != 0 && nums2[i] > nums2[stack.last!] {
                let last = stack.removeLast()
                map[nums2[last]] = nums2[i]
            }
            stack.append(i)
        }
        var res = [Int]()
        for i in 0..<nums1.count {
            let num = nums1[i]
            if map[num] != nil {
                res.append(map[num]!)
            }else {
                res.append(-1)
            }
        }
        return res
    }
}
