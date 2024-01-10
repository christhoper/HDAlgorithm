import UIKit

var greeting = "Hello, playground"

"""
编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1：
输入：strs = ["flower","flow","flight"]
输出："fl"

示例 2：
输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。

"""

let strs = ["flower","flow","fllight"]
let result = longestCommonPrefix2(strs)
print("结果是\(result)")

// MARK: - 解法1
// 横向对比
func longestCommonPrefix1(_ strs: [String]) -> String {
    if strs.isEmpty {
        return ""
    }
    
    var prefix = strs[0]
    var count = strs.count
    for index in 1..<count {
        prefix = longestCommonPrefix(string1: prefix, string2: strs[index])
        if prefix.isEmpty {
            break
        }
    }
    
    return prefix
}

func longestCommonPrefix(string1: String, string2: String) -> String {
    let length = min(string1.count, string2.count)
    var index: Int = 0
    
    var characters1: [Character] = Array(string1)
    var characters2: [Character] = Array(string2)
    while index < length && characters1[index] == characters2[index] {
        index += 1
    }

    return String(string1.prefix(upTo: string1.index(string1.startIndex, offsetBy: index)))
}


// MARK: - 解法2
// 先将字符串数组排序好
// 然后比较第一个和最后一个字符串有没有公共的即可
// 底层原理还是要排序每个字符串
func longestCommonPrefix2(_ strs: [String]) -> String {
    if strs.count <= 1 {
        return ""
    }
    
    var sortStrings = strs.sorted()
    var firt: [Character] = Array(sortStrings[0])
    var last: [Character] = Array(sortStrings[strs.count - 1])
    let minLength: Int = min(firt.count, last.count)
    var prefix: String = ""
    for index in 0..<minLength {
        if firt[index] != last[index] {
            break
        }
        prefix.append(firt[index])
    }
    
    return prefix
}
