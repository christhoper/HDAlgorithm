import UIKit

var greeting = "Hello, playground"

let list = [1]
let result = maxArea(list)
print("最大容量", result)

func maxArea(_ height: [Int]) -> Int {
    var left: Int = 0
    var right: Int = height.count-1
    // 盛水体积
    var res: Int = 0
    
    while left < right {
        if height[left] < height[right] {
            res = max(res, height[left] * (right-left))
            left += 1
        } else {
            res = max(res, height[right] * (right-left))
            right -= 1
        }
    }
    
    return res
    
}

