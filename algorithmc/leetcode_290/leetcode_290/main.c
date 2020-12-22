//
//  main.c
//  leetcode_290
//
//  Created by 王燊 on 2020/12/17.
//


//MARK: 题目描述

/*
 290. 单词规律
 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。

 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。

 示例1:

 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:

 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:

 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:

 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-pattern
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

bool wordPattern(char * pattern, char * s){

    int len = (int)strlen(pattern);
    char **resultArray = (char **)malloc(sizeof(char *) * 26); //创建长度为26的数组 下标为 pattern[j] - 'a'
    for (int i = 0; i < 26; i ++) {
        resultArray[i] = (char *)malloc(sizeof(char) * 100);
    }
    char *tmpSubS = (char *)malloc(sizeof(char) * 100);
    int index = 0;
    int start = 0;
    int i = 0;
    char space = ' ';
    int sLength =(int)strlen(s);
    while (index <= sLength) { //分割字符串
        char tmpC = s[index];
        if (tmpC == space || tmpC == '\0') {
            start = index + 1;
            if (i < len) {
                char *subS = resultArray[pattern[i] - 'a'];
                if (subS == NULL || strlen(subS) == 0) {
                    for (int k = 0; k < 26; k ++) {
                        if(strcmp(resultArray[k], tmpSubS) == 0) {
                            return false;
                        }
                    }
                    strcpy(subS, tmpSubS);
                }else {
                    if (strcmp(subS, tmpSubS) != 0) {
                        return false;
                    }
                }
                i ++;
            }else {
                return false;
            }
        }else {
            tmpSubS[index - start] = s[index];
        }
        index ++;
    }
    if (i != len) {
        return false;;
    }
    
    
    return true;
    
}

int main(int argc, const char * argv[]) {
    // insert code here...
//    printf("Hello, World!\n");
    printf("值为%d\n",wordPattern("abba","dog cat cat dog"));
    return 0;
}


