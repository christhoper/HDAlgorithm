import UIKit

var greeting = "Hello, playground"
"""
给你一个长度为 n 的整数数组 nums 和 一个目标值 target。请你从 nums 中选出三个整数，使它们的和与 target 最接近。

返回这三个数的和。

假定每组输入只存在恰好一个解。

 

示例 1：

输入：nums = [-1,2,1,-4], target = 1
输出：2
解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
示例 2：

输入：nums = [0,0,0], target = 1
输出：0
"""

let nums = [-1,2,1,-4]
let result = threeSumClosest(nums, 1)
print("结果", result)

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 {
        return 0
    }
    
    var sortNums: [Int] = nums.sorted()
    var answer: Int = Int.max
    
    func update(sum: Int) {
        if abs(sum - target) < abs(answer - target) {
            answer = sum
        }
    }
    
    for index in 0..<sortNums.count {
        // 保证和上一次的元素不相等
        if index > 0 && sortNums[index] == sortNums[index-1] {
            continue
        }
        
        var left: Int = index + 1
        var right: Int = sortNums.count - 1
        var current: Int = sortNums[index]
        
        while left < right {
            // 求三数和
            var sum = current + sortNums[left] + sortNums[right]
            // 相等，直接返回
            if sum == target {
                return target
            }
            
            update(sum: sum)
            
            if sum > target {
                // 如果和大于目标值，则将右指针向左移动
                var right0 = right - 1
                // 移动
                while left < right0 && sortNums[right0] == sortNums[right] {
                    right0 -= 1
                }
                
                right = right0
            } else {
                // 如果和小于目标，则将左边指针往右移动
                var left0 = left + 1
                // 移动到下一个不相等元素
                while left0 < right && sortNums[left0] == sortNums[left] {
                    left0 += 1
                }
                
                left = left0
            }
            
        }
        
    }
    
    return answer
}
