import UIKit

var greeting = "Hello, playground"
"""
给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

你返回所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
解释：
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
注意，输出的顺序和三元组的顺序并不重要。
示例 2：

输入：nums = [0,1,1]
输出：[]
解释：唯一可能的三元组和不为 0 。
示例 3：

输入：nums = [0,0,0]
输出：[[0,0,0]]
解释：唯一可能的三元组和为 0 。
"""

let test = [-1,0,1,2,-1,-4]
let result = threeSum(test)
print("结果", result)

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    
    var answer: [[Int]] = []
    // 排序
    var sortNums = nums.sorted()
    for index in 0..<sortNums.count {
        // 大于0，直接退出
        if sortNums[index] > 0 {
            break
        }
        
        // 去重，当起始值等于前一个元素值，得到的结果会和前一次结果一样
        // 比如：sortNums = [-1, -1, -1, 0, 1, 1]
        // sortNums[0] + sortNums[3] + sortNums[4] 和 sortNums[1] + sortNums[3] + sortNums[4] 结果一样
        if index > 0 && sortNums[index] == sortNums[index - 1] {
            continue
        }
        
        // 双指针
        var left: Int = index + 1
        var right: Int = sortNums.count - 1
        // 当前值
        let current: Int = sortNums[index]
        while left < right {
            // 三数相加
            var sum = current + sortNums[left] + sortNums[right]
            if sum == 0 {
                // 将符合条件的三个数放入答案数组
                answer.append([current, sortNums[left], sortNums[right]])
                
                // 移动指针，判断左指针下一个元素是否一样，一样则跳下一个
                while left < right && sortNums[left] == sortNums[left+1] {
                    left += 1
                    continue
                }
                
                // 同理左指针处理
                while left < right && sortNums[right] == sortNums[right-1] {
                    right -= 1
                    continue
                }
                
                // 将左指针往右移， 右指针往左移
                left += 1
                right -= 1
                
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
        
    }
    
    return answer
}
