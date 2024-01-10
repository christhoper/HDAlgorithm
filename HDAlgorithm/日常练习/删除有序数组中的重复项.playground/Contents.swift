import UIKit

var greeting = "Hello, playground"

var list = [1, 1, 2]
let result = removeDuplicates(&list)
print("返回的长度", result, list)


func removeDuplicates(_ nums: inout [Int]) -> Int {
    var endPoint: Int = 0
    var start: Int = 1
    while endPoint <= nums.count - 1 {
        if nums[endPoint] == nums[start] {
            nums.remove(at: endPoint)
            endPoint = 0
            start = 1
            
        } else {
            if start == nums.count - 1 {
                endPoint += 1
                start = 0
            } else {
                start += 1
            }
        }
        
        
    }
    
    return nums.count
}
