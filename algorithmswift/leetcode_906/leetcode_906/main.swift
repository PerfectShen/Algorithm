//
//  main.swift
//  leetcode_906
//
//  Created by 王燊 on 2020/12/20.
//

// 906.超级回文数 (困难)

/*
 如果一个正整数自身是回文数，而且它也是一个回文数的平方，那么我们称这个数为超级回文数。

 现在，给定两个正整数 L 和 R （以字符串形式表示），返回包含在范围 [L, R] 中的超级回文数的数目。

  

 示例：

 输入：L = "4", R = "1000"
 输出：4
 解释：
 4，9，121，以及 484 是超级回文数。
 注意 676 不是一个超级回文数： 26 * 26 = 676，但是 26 不是回文数。
  

 提示：

 1 <= len(L) <= 18
 1 <= len(R) <= 18
 L 和 R 是表示 [1, 10^18) 范围的整数的字符串。
 int(L) <= int(R)


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/super-palindromes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */




import Foundation


let solution = Solution1();
let count = solution.superpalindromesInRange("38455498359","999999999999999999");
print("超级回文数 个数 = \(count)")
//"1"
//"19028"
//"38455498359"
//"999999999999999999"
