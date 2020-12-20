//
//  main.swift
//  leetcode_912
//
//  Created by 王燊 on 2020/12/19.
//

// 排序数组  (中等)

/*
 给你一个整数数组 nums，请你将该数组升序排列。

  

 示例 1：

 输入：nums = [5,2,3,1]
 输出：[1,2,3,5]
 示例 2：

 输入：nums = [5,1,1,2,0,0]
 输出：[0,0,1,1,2,5]
  

 提示：

 1 <= nums.length <= 50000
 -50000 <= nums[i] <= 50000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 思路  数组升序
/*
 
 */
import Foundation

let nums = [5,2,3,1]

//var nums = [Int]()


//for i in 0..<originNums.count {
//    nums.append(originNums[i])
//}
//let address = String(format: "%p", nums)
//print(address)

let solution = Solution2();
var result = solution.sortArray(nums)
print("排序结果为\(result)")
