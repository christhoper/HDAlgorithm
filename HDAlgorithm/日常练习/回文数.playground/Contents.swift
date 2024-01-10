import UIKit

var greeting = "Hello, playground"
var content = 10000000000
let isP = isPalindrome(&content)
print(isP)

func isPalindrome(_ x: inout Int) -> Bool {
    if x < 0 || x % 10 == 0 && x != 0 {
        return false
    }

    var revertedNumber = 0
    while x > revertedNumber {
        revertedNumber = revertedNumber * 10 + x % 10
        x /= 10
    }
    
    return x == revertedNumber || x == revertedNumber / 10
}
