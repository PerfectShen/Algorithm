//
//  Solution.swift
//  lc_1202_交换字符串中的元素
//
//  Created by 王燊 on 2021/1/11.
//

import Foundation

// 并查集

class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        if pairs.count == 0 {return s}
        let slist = s.map({$0})
        let unionFind = UnionFind(s.count)
        var set = Set<Int>()
        // 同一对索引在同一个并查集中
        for i  in 0..<pairs.count  {
            let start = pairs[i][0]
            let end = pairs[i][1]
            set.insert(start)
            set.insert(end)
            unionFind.union(start, end)
        }
        
        // i 对应的所在并查集 对应的字母集和
        var map = [Int:[String]]()
        for i in 0..<slist.count {
            if set.contains(i) {
                let tmpS = String(slist[i])
                let rootI = unionFind.find(i)
                if map[rootI] != nil {
                    var subArray = map[rootI]
                    subArray!.append(tmpS)
                    map[rootI] = subArray
                }else {
                    var subArray = [String]()
                    subArray.append(tmpS)
                    map[rootI] = subArray
                }
            }
        }
       
        // 对字母集进行排序 AESC
        for key in map.keys {
            var array = map[key]
            array!.sort(by: ({$0 < $1}))
            map[key] = array
        }
        // 生成新的字符数组
        var res = [String]()
        for i in 0..<slist.count {
            if set.contains(i) {
                let rootI = unionFind.find(i)
                var subArray = map[rootI]
                res.append(subArray!.removeFirst())
                map[rootI] = subArray
            }else {
                res.append(String(slist[i]))
            }
            
        }
        
        return res.joined()
    }
    
    
    class UnionFind {
        var parent : [Int]
        var rank : [Int]
        init(_ len : Int) {
            self.parent = [Int](repeating: 0, count: len)
            self.rank = [Int](repeating: 1, count: len)
            for i in 0..<len {
                self.parent[i] = i
            }
        }
        
        func union(_ a : Int,_ b : Int)  {
            let rootA = find(a)
            let rootB = find(b)
            if rootA == rootB { //说明a和b在同一个并查集中
                return
            }
            if rank[rootA] == rank[rootB] { //rootA高度和rootB高度相等,可任意将某一个合并打另外一个
                parent[rootA] = rootB;
                rank[rootB] += 1
            }else if rank[rootA] < rank[rootB] {
                parent[rootA] = rootB
            }else {
                parent[rootB] = rootA
            }
        }
        func find(_ x : Int) -> Int {
            var a = x
            var b = x
            while a != parent[a] {
                a = parent[a]
            }
            // 并查集树缩小高度
            while b != parent[b] {
                parent[b] = a;
                b = parent[b]
            }
            return parent[a]
        }
    }
}
