//
//  main.swift
//  leetcode_48
//
//  Created by 王燊 on 2020/12/19.
//

/*
 48. 旋转图像   难度 中等
 给定一个 n × n 的二维矩阵表示一个图像。

 将图像顺时针旋转 90 度。

 说明：

 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。

 示例 1:

 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 示例 2:

 给定 matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-image
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


// 解题思路
/*
 1. 首先分转置前和转置后二维数组的区别,得出规律
 matrix[row][col] = matrix[count - col - 1][row];
 2. 从[0][0]位置开始转置数据,4次之后回重新回到[0][0]位置,然后再i++ 继续转置.
 3. 循环条件为 外层循环 i < (count - 1)/2; 只需要遍一半就可以将全部数据转置
 4. 内存循环 j in i..<count - i - 1, 以回形缩小.
 5. 扩展- 顺时针或者逆时针旋转
 */

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count;
        for i in 0...(count - 1)/2 {
            for j in i..<count - i - 1 {
                var row = i;
                var col = j;
                let tmp = matrix[row][col];
                var times = 0;
                while times < 4 {
                    print("当前转置\(matrix[row][col])[\(row)][\(col)] -> \(matrix[count - col - 1][row])[\(count - col - 1)][\(row)]")
                    if times < 3 {
                        matrix[row][col] = matrix[count - col - 1][row];
                    }else {
                        matrix[row][col] = tmp;
                    }
                    let oldRow = row;
                    row = count - col - 1;
                    col = oldRow;
                    
                    times += 1;
                }
            }
        }
    }
}

//var matrix = [
//    [ 5, 1, 9,11],
//    [ 2, 4, 8,10],
//    [13, 3, 6, 7],
//    [15,14,12,16]
//  ]
var matrix = [
                [1,2,3],
                [4,5,6],
                [7,8,9]
            ]

let solution = Solution();
solution.rotate(&matrix);
print("转至后-----------------------")
print(matrix)
