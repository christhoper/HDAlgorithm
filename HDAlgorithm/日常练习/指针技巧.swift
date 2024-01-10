//
//  删除有序数组里重复数据.swift
//  HDAlgorithm
//
//  Created by bailun on 2023/2/8.
//

import Foundation

// MARK: - 快慢指针法
// fast\slow
class FSPointer {
    
    /// 删除排序好的数组中，重复的数据，并返回删除后数组的长度；只能原地修改，不用考虑新数组后面的元素，比如 [1, 2, 2, 3, 4, 4]，删除后重复的新数组是 [1, 2, 3, 4, 2, 4]
    /// - Parameter dataSource: <#dataSource description#>
    /// - Returns: <#description#>
    static func deletedDuplicates(dataSource: inout [Int]) -> Int {
        if dataSource.isEmpty {
            return -1
        }
        
        var slow = 0, fast = 0
        while fast < dataSource.count {
            if dataSource[fast] != dataSource[slow] {
                slow += 1
                // 维护无重复的数组
                dataSource[slow] = dataSource[fast]
            }
            fast += 1
        }
        
        // 数组长度为慢指针索引+1
        return slow + 1
    }
    
    
    /// 删除链表中重复的元素
    /// - Parameter nodes: <#nodes description#>
    static func deletedDuplicatesListNode(listNode: ListNode) -> ListNode {
        guard listNode != nil else {
            return listNode
        }
        
        var slow = listNode.first, fast = listNode.first
        while fast != nil, fast?.next != nil {
            if fast?.value != slow?.value {
                slow?.next = fast
                
                // 慢指针 +1
                slow = slow?.next!
            }
            
            // 快指针 +1
            fast = fast?.next!
        }
        
        // 断开与后面重复的元素连接
        slow?.next = nil
        
        return listNode
    }
    
    /// [1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 5, 9, 10, 0]
    /// [1, 1, 4, 4, 5, 9, 10, 0, 2, 2, 2, 2, 4, 4, 5, 9, 10, 0]
    /// 思考，上面的后面怎么还出现 2 target
    /// 删除后的数组长度，比如[1, 2, 2, 3, 4, 4]，target为2，则删除后变成[1, 3, 4, 4, 4, 4]，后面多出的两个4，是删除了两个2的原因
    /// - Parameters:
    ///   - list: <#list description#>
    ///   - target: <#target description#>
    /// - Returns: 返回的长度及时删除后数组长度
    static func deletedDuplicatedWithTarget(list: inout [Int], target: Int) -> Int {
        if list.isEmpty { return -1 }
        
        var slow = 0, fast = 0
        while fast < list.count {
            if list[fast] != target {
                list[slow] = list[fast]
                slow += 1
            }
            
            fast += 1
        }
        
        return slow
    }
    
    
    /// 将数组中的0移动到后面
    /// - Parameter list: <#list description#>
    static func moveZerosToEnd(list: inout [Int]) {
        let newListCount = deletedDuplicatedWithTarget(list: &list, target: 0)
        for index in newListCount..<list.count {
            list[index] = 0
        }
    }
}


// MARK: - 左右指针法
// left\right
class LRPointer {
    
    /// 二分查找
    /// 排序好的数组，找出目标值并返回下标
    static func binarySearch(list: inout [Int], target: Int) -> Int {
        if list.isEmpty { return -1 }
        var left: Int = 0, right = list.count - 1

        while left <= right {
            let mid: Int = (right + left) >> 1
            if list[mid] == target {
                return mid
            } else if list[mid] < target {
                left = mid + 1
            } else if list[mid] > target {
                right = mid + 1
            }
        }
        
        return -1
    }
    
    /// 在已排序的数组中，找出符合目标值的两个数相加之和等于目标值的下标，比如 [1, 2, 3, 4, 5, 6]，目标是9
    /// 每个输入只对应唯一答案，且不可以重复使用相同元素
    static func twoSum(list: [Int], target: Int) -> [Int] {
        if list.isEmpty { return [] }
        var left: Int = 0, right = list.count - 1
        while left < right {
            let sum = list[left] + list[right]

            if sum == target {
                return [left, right]
            } else if sum < target {
                // 让sum大一点，往右移
                left += 1
            } else if sum > target {
                // sum小一点，往左移
                right -= 1
            }
        }
        
        return []
    }
    
    /// 字符串反转
    static func reverseString(chars: inout [Character]) {
        if chars.isEmpty { return }
        
        var left: Int = 0, right = chars.count - 1
        while left < right {
            let tempChar = chars[left]
            chars[left] = chars[right]
            chars[right] = tempChar
            
            left += 1
            right -= 1
        }
    }
    
    /// 是否是回文
    static func isPalindrome(content: String) -> Bool {
        if content.isEmpty { return false }
        
        let charList = content.map({String($0)})
        var left: Int = 0, right = charList.count - 1
        while left < right {
            if charList[left] != charList[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        
        return true
    }
    
    static func palindrome(content: String, left: Int, right: Int) -> String {
        if content.isEmpty { return "" }
        let charList = content.map({ String($0) })
        var left = left, right = right
        
        while left >= 0, right < charList.count, charList[left] == charList[right] {
            left -= 1
            right += 1
        }
        
        let index1 = String.Index(utf16Offset: left+1, in: content)
        let index2 = String.Index(utf16Offset: right, in: content)
        
        let range: Range = index1..<index2
        
        return content.substring(with: range)
  
    }
    
    static func longPalindrome(content: String) -> String {
        var result = ""
        for index in 0..<content.count {
            let s1 = palindrome(content: content, left: index, right: index)
            let s2 = palindrome(content: content, left: index, right: index+1)
            
            result = result.count > s1.count ? result : s1
            result = result.count > s2.count ? result : s2
        }
        
        return result
    }
}
