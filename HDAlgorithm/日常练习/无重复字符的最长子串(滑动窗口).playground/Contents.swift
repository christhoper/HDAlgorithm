import UIKit

var greeting = "Hello, playground"
"""
给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
"""

let content = "1234567891000-0abcdertyuiohgp]=91"
let result = lengthOfLongestSubstring(content)
print("最长长度", result)

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxCount: Int = 0
    var start: Int = 0
    let chars: [Character] = Array(s)
    var map: [Character: Int] = [:]
    
    // 【start, end】这个区间，无重复的话相当于【start, end+1】
    // end就是遍历时下标位置
    for (end, char) in chars.enumerated() {
        // 获取map记录的下标位置，没有获取到值，说明没有重复的，如果positon = map[char]有值，说明有重复了
        if let positon = map[char] {
            start = max(start, positon)
        }
        
        // 记录位置，如果字符相，会覆盖记录的值
        map[char] = end + 1
        maxCount = max(maxCount, end - start + 1)
    }
    
    return maxCount
}
