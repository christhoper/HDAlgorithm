import UIKit

var greeting = "Hello, playground"

let num = 123455688888888
let result = reverse(num)
print("结果", result, Int.min, Int.max)

func reverse(_ x: Int) -> Int {
    var num = x
    var rev = 0
    let min: Int = -(1 << 31) + 1
    let max: Int = (1 << 31) - 1
    while num != 0 {
        if rev < min / 10 || rev > max / 10 {
            return 0
        }
        
        // 取余数，获取尾数
        var digit = num % 10
        // 除，获取取余数后的数字
        // 例子：123456
        // digit 取一次后面的余数 = 6
        // 取完后结果num就变成num/10 = 12345
        num /= 10
        rev = rev * 10 + digit
    }
    
    return rev
}
