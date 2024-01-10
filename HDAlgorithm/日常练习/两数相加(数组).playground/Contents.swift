import UIKit

var greeting = "Hello, playground"


let arry = [3, 2, 11, 15, 0]
let result = twoSum(arry, 3)
print(result)

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var left: Int = 0
    var right: Int = 1
    
    while left <= nums.count - 1 {
        var leftNum: Int = nums[left]
        var rightNum: Int = nums[right]
        let sum: Int = leftNum + rightNum
        
        if target == sum {
            return [left, right]
        } else  {
            if left < nums.count - 2 {
                if right == nums.count - 1 {
                    left += 1
                    right = left + 1
                } else if right > left {
                    right += 1
                }
            } else {
                return []
            }
        }
        
    }
    
    return []
    
}
