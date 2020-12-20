//
//  Solution2.swift
//  leetcode_720
//
//  Created by 王燊 on 2020/12/20.
//

import Foundation


public class TreeNode {
    var word : String
    var isWord : Bool
    var height : Int
    var nexts : Dictionary<String,TreeNode>
    var parent : TreeNode?
    var string : String?
    public init(_ word: String) {
        self.word = word
        self.nexts = [String:TreeNode]()
        self.isWord = false
        self.height = 1
        self.parent = nil
        self.string = nil
    }
}

// 前缀树
class Solution2 {
    func longestWord(_ words: [String]) -> String {
        //words
        var treeMap = [String:TreeNode]()
        var operationWords = words;
        operationWords.sort()
        var maxTreeHeight = 0
        
        for i in 0..<operationWords.count {
            let tmpString = operationWords[i]
            
            if tmpString.count == 0 { //如果存在空字符串 返回空
                return ""
            }
            let first = String(tmpString.prefix(1));
            var tree = treeMap[first]
            if tree == nil &&  tmpString.count == 1 {
                tree = TreeNode(first)
                tree!.string = tmpString
                tree!.isWord = true
                treeMap[first] = tree
                maxTreeHeight = max(maxTreeHeight, tree!.height)
            }
            
            if tree != nil {
                if tmpString.count > 1 {
                    addNode(tree!,tmpString)
                    maxTreeHeight = max(maxTreeHeight, tree!.height)
                }
            }
        }
        
        // 遍历前缀树
        var vailArray = [String]()
        for key in treeMap.keys {
            let tree = treeMap[key]
            let string = travel(tree!)
            if string.count > 0 {
                vailArray.append(string)
            }
            
        }
       
     
        if vailArray.count > 0 {
            var maxCount = 0
            var resultArray = [String]()
            for tmp in vailArray {
                maxCount = max(maxCount, tmp.count)
            }
            for tmp in vailArray {
                if maxCount == tmp.count {
                    resultArray.append(tmp)
                }
            }
            resultArray.sort()
            return resultArray.first!
        }else {
            return "";
        }
       
    }
    
    func addNode(_ t : TreeNode,_ string : String) -> Void {
        
        var node = t;
        var i = 1
        while i < string.count {
            let word = String(String(string.prefix(i+1)).suffix(1))
            var map = node.nexts;
            var nextNode = map[word]
            if nextNode == nil && node.isWord { //如果当前点为单词 则创建next节点,如果不是不需要创建.说明当前字符串没有前缀字符串
                if map.count == 0 {
                    node.height += 1;
                    var updateNode = node.parent;
                    while updateNode != nil  {
                        updateNode!.height += 1;
                        updateNode = updateNode!.parent;
                    }
                }
                nextNode = TreeNode(word)
                map[word] = nextNode;
                node.nexts = map
                nextNode!.parent = node;
                
                if i == string.count - 1 {
                    nextNode!.string = string;
                    nextNode!.isWord = true
                }
            }
            if nextNode == nil {
                break
            }else {
                node = nextNode!;
            }
            i += 1
        }
    }
    
    
    func travel(_ t : TreeNode) ->  String {
        var map = [Int:[TreeNode]]()
        deepTravel(t,1,&map)
        
        var stringArray = [String]()
        for i in 1...map.count {
            let tmpArray = map[map.count - i + 1]
           
            for tmpNode in tmpArray! {
                let aString = tmpNode.string;
                if aString != nil  {
                    stringArray.append(aString!)
                }
            }
        }
        

        if stringArray.count > 0 {
            var maxCount = 0
            var resultArray = [String]()
            for tmp in stringArray {
                maxCount = max(maxCount, tmp.count)
            }
            for tmp in stringArray {
                if maxCount == tmp.count {
                    resultArray.append(tmp)
                }
            }
            resultArray.sort()
            return resultArray.first!
        }else {
            return "";
        }
        
    }
    
    func deepTravel(_ t : TreeNode,_ level : Int,_ map : inout [Int:[TreeNode]]) -> Void {
        
        var tmpArray = map[level]
        if tmpArray == nil {
            tmpArray = [TreeNode]()
        }
        tmpArray?.append(t)
        map[level] = tmpArray
//        print("第\(level)层 -- \(t.word)")
        let tmpMap = t.nexts;
        for key in tmpMap.keys {
            let tmpNode = tmpMap[key]
            deepTravel(tmpNode!,level + 1,&map)
        }
    }
}
