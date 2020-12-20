//
//  main.swift
//  leetcode_720
//
//  Created by 王燊 on 2020/12/20.
//

//720. 词典中最长的单词 (简单)

/*
 给出一个字符串数组words组成的一本英语词典。从中找出最长的一个单词，该单词是由words词典中其他单词逐步添加一个字母组成。若其中有多个可行的答案，则返回答案中字典序最小的单词。

 若无答案，则返回空字符串。

  

 示例 1：

 输入：
 words = ["w","wo","wor","worl", "world"]
 输出："world"
 解释：
 单词"world"可由"w", "wo", "wor", 和 "worl"添加一个字母组成。
 示例 2：

 输入：
 words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
 输出："apple"
 解释：
 "apply"和"apple"都能由词典中的单词组成。但是"apple"的字典序小于"apply"。
  

 提示：

 所有输入的字符串都只包含小写字母。
 words数组长度范围为[1,1000]。
 words[i]的长度范围为[1,30]。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-word-in-dictionary
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

let solution1 = Solution1();
let solution2 = Solution2();
let solution3 = Solution3();


let words = ["a","banana","app","appl","ap","apply","apple"] //["ts","e","x","pbhj","opto","xhigy","erikz","pbh","opt","erikzb","eri","erik","xlye","xhig","optoj","optoje","xly","pb","xhi","x","o"]
    //["yo","ew","fc","zrc","yodn","fcm","qm","qmo","fcmz","z","ewq","yod","ewqz","y"]
    //["rac","rs","ra","on","r","otif","o","onpdu","rsf","rs","ot","oti","racy","onpd"] //["b","br","bre","brea","break","breakf","breakfa","breakfas","breakfast","l","lu","lun","lunc","lunch","d","di","din","dinn","dinne","dinner"] //["ogz","eyj","e","ey","hmn","v","hm","ogznkb","ogzn","hmnm","eyjuo","vuq","ogznk","og","eyjuoi","d"]
    //["vsw","vs","zwu","vsx","nc","o","vswus","orv","imf","i","v","zw","vs"]
print("solution1 --------------------------------------")
print(solution1.longestWord(words))
print("solution2 --------------------------------------")
print(solution2.longestWord(words))
print("solution3 --------------------------------------")
print(solution3.longestWord(words))
