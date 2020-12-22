//
//  main.c
//  leetcode_1
//
//  Created by 王燊 on 2020/12/9.
//

#include <stdio.h>
#include <stdlib.h>

//MARK: 题目描述
/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

  

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 时间复杂度为 O(n^2) 空间复杂度为O(1)
// 解题思路 从素组下标0开始遍历 找到当前元素为 a, 从下标1开始寻找元素b 使得 a + b = target;
// 如果找到的话返回 a 和 b 对应的下标,否则再次从下标1开始遍历 重复以上步骤
int* twoSum(int* nums, int numsSize, int target, int* returnSize){
//    int * buffer = ( int * )malloc( sizeof( int ) * nums1Size );
    *returnSize = 2;
    int *returnArray = (int *)malloc( sizeof(int) * (*returnSize)); // 返回索引数组
    
    for (int i = 0; i < numsSize - 1; i ++) {
        for (int j = i + 1; j < numsSize; j ++) {
            if (nums[i] + nums[j] == target) {
                returnArray[0] = i;
                returnArray[1] = j;
                return returnArray;
            }
        }
    }
    *returnSize = 0;
    return returnArray;
}

//



int main(int argc, const char * argv[]) {
    // insert code here...
    int nums[5] = {1,2,3,4,6};
    int returnSize;
    int *returnArray = twoSum(nums, 5,10, &returnSize);
    printf("%d\n",returnSize);
    for (int i = 0; i < returnSize; i ++) {
        printf("第%d个元素 = %d\n",i,returnArray[i]);
    }
    return 0;
}


