//
//  Solution2.swift
//  leetcode_912
//
//  Created by 王燊 on 2020/12/19.
//

// 归并排序
import Foundation


class Solution2 {
    func sortArray(_ nums: [Int]) -> [Int] {
        var oNums = nums;
        self.midSortArray(&oNums,0,nums.count)
        return oNums;
    }
    
    func midSortArray(_ nums: inout [Int],_ start : Int, _ end : Int) -> Void {
        if end - start < 2 {
            return ;
        }
        let mid = (start + end) >> 1
        
        self.midSortArray(&nums,start,mid)
        self.midSortArray(&nums,mid,end)
        merge(&nums, start, mid, end)
    }
    
    func merge(_ nums: inout [Int],_ start : Int,_ mid : Int , _ end : Int) -> Void {
        
        var li = 0;
        let le = mid - start;
        
        var ri = mid;
        let re = end;
        
        var ai = start
        
        var leftNums = [Int]()
        for i in li..<le {
            leftNums.append(nums[start + i])
        }
        
        // 如果左边还没有结束
        while (li < le) {
            if (ri < re && nums[ri] < leftNums[li] ) {
                nums[ai] = nums[ri];
                ai += 1
                ri += 1
            } else {
                nums[ai] = leftNums[li];
                ai += 1
                li += 1
            }
        }
       
    }
    
}

