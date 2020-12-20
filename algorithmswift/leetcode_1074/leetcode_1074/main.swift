//
//  main.swift
//  leetcode_1074
//
//  Created by 王燊 on 2020/12/19.
//

// 1074. 元素和为目标值的子矩阵数量 (困难)

/*
 给出矩阵 matrix 和目标值 target，返回元素总和等于目标值的非空子矩阵的数量。

 子矩阵 x1, y1, x2, y2 是满足 x1 <= x <= x2 且 y1 <= y <= y2 的所有单元 matrix[x][y] 的集合。

 如果 (x1, y1, x2, y2) 和 (x1', y1', x2', y2') 两个子矩阵中部分坐标不同（如：x1 != x1'），那么这两个子矩阵也不同。

  

 示例 1：

 输入：matrix = [[0,1,0],[1,1,1],[0,1,0]], target = 0
 输出：4
 解释：四个只含 0 的 1x1 子矩阵。
 示例 2：

 输入：matrix = [[1,-1],[-1,1]], target = 0
 输出：5
 解释：两个 1x2 子矩阵，加上两个 2x1 子矩阵，再加上一个 2x2 子矩阵。
  

 提示：

 1 <= matrix.length <= 300
 1 <= matrix[0].length <= 300
 -1000 <= matrix[i] <= 1000
 -10^8 <= target <= 10^8

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-submatrices-that-sum-to-target
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


//MARK 解题思路
// 一. 暴力算法 多次重复计算  时间复杂度过高

// 优化思路
/*
   //迭代方式
   
 */

import Foundation


//let matrix = [[0,1,0],[1,1,1],[0,1,0]]
//let matrix = [[1,-1],[-1,1]]

//let matrix = [
//    [0,1,1,1,0,1],
//    [0,0,0,0,0,1],
//    [0,0,1,0,0,1],
//    [1,1,0,1,1,0],
//    [1,0,0,1,0,0]]

let matrix = [[0,1,0,0,1],[0,0,1,1,1],[1,1,1,0,1],[1,1,0,1,1],[0,1,1,0,0]];

//[[0, 1, 2, 3, 3, 4],
// [0, 0, 0, 0, 0, 1],
// [0, 0, 1, 1, 1, 2],
// [1, 2, 2, 3, 4, 4],
// [1, 1, 1, 2, 2, 2]]

//[[0, 1, 2, 3, 3, 4],
// [0, 1, 2, 3, 3, 5],
// [0, 0, 2, 3, 3, 5],
// [1, 2, 2, 3, 5, 5],
// [2, 3, 2, 4, 5, 5]]

//[[0, 1, 2, 3, 3, 4], [0, 1, 2, 3, 3, 5], [0, 1, 3, 4, 4, 7], [1, 3, 5, 7, 8, 11], [2, 4, 6, 9, 10, 13]]

let target = 1;

//let solution = Solution2();
//let result = solution.numSubmatrixSumTarget(matrix,target);
//print("子矩阵数量为\(result)")

//let solution = Solution1();
//let result = solution.numSubmatrixSumTarget(matrix,target);
//print("子矩阵数量为\(result)")

let solution = Solution5();
let result = solution.numSubmatrixSumTarget(matrix,target);
print("子矩阵数量为\(result)")
