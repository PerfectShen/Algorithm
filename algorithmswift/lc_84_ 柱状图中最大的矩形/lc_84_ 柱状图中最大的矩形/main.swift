//
//  main.swift
//  lc_84_ 柱状图中最大的矩形
//
//  Created by 王燊 on 2020/12/26.
//

//84. 柱状图中最大的矩形 (困难)

/*
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

 求在该柱状图中，能够勾勒出来的矩形的最大面积。

  



 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。

  



 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。

  

 示例:

 输入: [2,1,5,6,2,3]
 输出: 10


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/largest-rectangle-in-histogram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


import Foundation

let solution = Solution()
let heights = [5,5,1,7,1,1,5,2,7,6]
    //[2,1,5,6,2,3]
    //
    //[2,1,5,6,2,3]

print(solution.largestRectangleArea(heights))
